/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2019 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "fsl_phy.h"
#include "pin_mux.h"
#include "board.h"
#include <stdio.h>
/*******************************************************************************
 * Definitions
 ******************************************************************************/

/*! @brief Defines the timeout macro. */
#define PHY_TIMEOUT_COUNT 500000

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*!
 * @brief Get the ENET instance from peripheral base address.
 *
 * @param base ENET peripheral base address.
 * @return ENET instance.
 */
extern uint32_t ENET_GetInstance(ENET_Type *base);

/*******************************************************************************
 * Variables
 ******************************************************************************/

#if !(defined(FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL) && FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL)
/*! @brief Pointers to enet clocks for each instance. */
#if defined(FSL_FEATURE_SOC_ENET_COUNT) && (FSL_FEATURE_SOC_ENET_COUNT > 0)
extern clock_ip_name_t s_enetClock[FSL_FEATURE_SOC_ENET_COUNT];
#elif defined(FSL_FEATURE_SOC_LPC_ENET_COUNT) && (FSL_FEATURE_SOC_LPC_ENET_COUNT > 0)
extern clock_ip_name_t s_enetClock[FSL_FEATURE_SOC_LPC_ENET_COUNT];
#endif
#endif /* FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL */

/*******************************************************************************
 * Code
 ******************************************************************************/

status_t PHY_Init(ENET_Type *base, uint32_t phyAddr, uint32_t srcClock_Hz)
{

    uint32_t instance = ENET_GetInstance(base);



    PHY_RESET_SET(0);
    PHY_RESET_SET(1);

#if !(defined(FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL) && FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL)
    /* Set SMI first. */
    CLOCK_EnableClock(s_enetClock[instance]);
#endif /* FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL */

#if defined(FSL_FEATURE_SOC_ENET_COUNT) && (FSL_FEATURE_SOC_ENET_COUNT > 0)
    ENET_SetSMI(base, srcClock_Hz, false);
#elif defined(FSL_FEATURE_SOC_LPC_ENET_COUNT) && (FSL_FEATURE_SOC_LPC_ENET_COUNT > 0)
    ENET_SetSMI(base);
#endif




    return kStatus_Success;
}
static status_t PHY_Read_Raw(ENET_Type *base, uint32_t phyAddr, uint32_t phyReg, uint32_t *dataPtr);
static status_t PHY_Write_Raw(ENET_Type *base, uint32_t phyAddr, uint32_t phyReg, uint32_t data);

status_t PHY_Read(ENET_Type *base, uint32_t phyAddr, uint32_t phyReg, uint32_t *dataPtr)
{
	if(phyReg<0xF)
		return PHY_Read_Raw(base,phyAddr,phyReg,dataPtr);

	status_t ret = kStatus_Success;

	 // Set address
	if(ret==kStatus_Success)	PHY_Write_Raw(base, phyAddr, PHY_REGCR_REG, 0x001f);
	if(ret==kStatus_Success)	PHY_Write_Raw(base, phyAddr, PHY_ADDAR_REG, phyReg);


		 // Write value
	if(ret==kStatus_Success) PHY_Write_Raw(base, phyAddr, PHY_REGCR_REG, 0x401F);
	if(ret==kStatus_Success) PHY_Read_Raw(base, phyAddr, PHY_ADDAR_REG, dataPtr);
	return ret;

}
status_t PHY_Write(ENET_Type *base, uint32_t phyAddr, uint32_t phyReg, uint32_t data){
	if(phyReg<0xF)
		return PHY_Write_Raw(base,phyAddr,phyReg,data);
	status_t ret = kStatus_Success;
	 // Set address
	if(ret==kStatus_Success)PHY_Write_Raw(base, phyAddr, PHY_REGCR_REG, 0x001f);
	if(ret==kStatus_Success)PHY_Write_Raw(base, phyAddr, PHY_ADDAR_REG, phyReg);


	 // Write value
	if(ret==kStatus_Success)PHY_Write_Raw(base, phyAddr, PHY_REGCR_REG, 0x401F);
	if(ret==kStatus_Success)PHY_Write_Raw(base, phyAddr, PHY_ADDAR_REG, data);
	return ret;
}

status_t PHY_Write_Raw(ENET_Type *base, uint32_t phyAddr, uint32_t phyReg, uint32_t data)
{
#if defined(FSL_FEATURE_SOC_ENET_COUNT) && (FSL_FEATURE_SOC_ENET_COUNT > 0)
    uint32_t counter;

    /* Clear the SMI interrupt event. */
    ENET_ClearInterruptStatus(base, ENET_EIR_MII_MASK);

    /* Starts a SMI write command. */
    ENET_StartSMIWrite(base, phyAddr, phyReg, kENET_MiiWriteValidFrame, data);

    /* Wait for SMI complete. */
    for (counter = PHY_TIMEOUT_COUNT; counter > 0; counter--)
    {
        if (ENET_GetInterruptStatus(base) & ENET_EIR_MII_MASK)
        {
            break;
        }
    }

    /* Check for timeout. */
    if (!counter)
    {
        return kStatus_PHY_SMIVisitTimeout;
    }

    /* Clear MII interrupt event. */
    ENET_ClearInterruptStatus(base, ENET_EIR_MII_MASK);

#elif defined(FSL_FEATURE_SOC_LPC_ENET_COUNT) && (FSL_FEATURE_SOC_LPC_ENET_COUNT > 0)
    ENET_StartSMIWrite(base, phyAddr, phyReg, data);
    while (ENET_IsSMIBusy(base))
        ;
#endif
    return kStatus_Success;
}

status_t PHY_Read_Raw(ENET_Type *base, uint32_t phyAddr, uint32_t phyReg, uint32_t *dataPtr)
{
#if defined(FSL_FEATURE_SOC_ENET_COUNT) && (FSL_FEATURE_SOC_ENET_COUNT > 0)
    assert(dataPtr);

    uint32_t counter;

    /* Clear the MII interrupt event. */
    ENET_ClearInterruptStatus(base, ENET_EIR_MII_MASK);

    /* Starts a SMI read command operation. */
    ENET_StartSMIRead(base, phyAddr, phyReg, kENET_MiiReadValidFrame);

    /* Wait for MII complete. */
    for (counter = PHY_TIMEOUT_COUNT; counter > 0; counter--)
    {
        if (ENET_GetInterruptStatus(base) & ENET_EIR_MII_MASK)
        {
            break;
        }
    }

    /* Check for timeout. */
    if (!counter)
    {
        return kStatus_PHY_SMIVisitTimeout;
    }

    /* Get data from MII register. */
    *dataPtr = ENET_ReadSMIData(base);

    /* Clear MII interrupt event. */
    ENET_ClearInterruptStatus(base, ENET_EIR_MII_MASK);
#elif defined(FSL_FEATURE_SOC_LPC_ENET_COUNT) && (FSL_FEATURE_SOC_LPC_ENET_COUNT > 0)
    ENET_StartSMIRead(base, phyAddr, phyReg);
    while (ENET_IsSMIBusy(base))
        ;
    *dataPtr = ENET_ReadSMIData(base);
#endif
    return kStatus_Success;
}

status_t PHY_GetLinkStatus(ENET_Type *base, uint32_t phyAddr, bool *status)
{
    uint32_t reg;
    status_t result = kStatus_Success;

    /* Read the basic status register. */
    result = PHY_Read(base, phyAddr, PHY_BASICSTATUS_REG, &reg);
    if (result == kStatus_Success)
    {
        if (reg & PHY_BSTATUS_LINKSTATUS_MASK)
        {
            /* link up. */
            *status = true;
        }
        else
        {
            *status = false;
        }
    }
    return result;
}

status_t PHY_GetLinkSpeedDuplex(ENET_Type *base, uint32_t phyAddr, phy_speed_t *speed, phy_duplex_t *duplex)
{
    assert(duplex);
    assert(speed);

    uint32_t reg;
    status_t result = kStatus_Success;

    /* Read the control two register. */
    result = PHY_Read(base, phyAddr, PHY_SEPCIAL_CONTROL_REG, &reg);
    if (result == kStatus_Success)
    {
        if (reg & PHY_SPECIALCTL_DUPLEX_MASK)
        {
            /* Full duplex. */
            *duplex = kPHY_FullDuplex;
        }
        else
        {
            /* Half duplex. */
            *duplex = kPHY_HalfDuplex;
        }

        if (reg & PHY_SPECIALCTL_100SPEED_MASK)
        {
            /* 100M speed. */
            *speed = kPHY_Speed100M;
        }
        else
        { /* 10M speed. */
            *speed = kPHY_Speed10M;
        }
    }
    return result;
}
