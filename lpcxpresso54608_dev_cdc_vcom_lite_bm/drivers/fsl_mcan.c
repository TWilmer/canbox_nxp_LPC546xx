/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016-2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#include "fsl_mcan.h"

/*******************************************************************************
 * Definitions
 ******************************************************************************/

/* Component ID definition, used by tools. */
#ifndef FSL_COMPONENT_ID
#define FSL_COMPONENT_ID "platform.drivers.mcan"
#endif

#define MCAN_TIME_QUANTA_NUM (16U)

#define IDEAL_SP_LOW (750U)
#define IDEAL_SP_MID (800U)
#define IDEAL_SP_HIGH (875U)
#define IDEAL_SP_FACTOR (1000U)

#define MAX_DSJW (CAN_DBTP_DSJW_MASK >> CAN_DBTP_DSJW_SHIFT)
#define MAX_DTSEG2 (CAN_DBTP_DTSEG2_MASK >> CAN_DBTP_DTSEG2_SHIFT)
#define MAX_DTSEG1 (CAN_DBTP_DTSEG1_MASK >> CAN_DBTP_DTSEG1_SHIFT)
#define MAX_DBRP (CAN_DBTP_DBRP_MASK >> CAN_DBTP_DBRP_SHIFT)

#define MAX_NSJW (CAN_NBTP_NSJW_MASK >> CAN_NBTP_NBRP_SHIFT)
#define MAX_NTSEG2 (CAN_NBTP_NTSEG2_MASK >> CAN_NBTP_NTSEG2_SHIFT)
#define MAX_NTSEG1 (CAN_NBTP_NTSEG1_MASK >> CAN_NBTP_NTSEG1_SHIFT)
#define MAX_NBRP (CAN_NBTP_NBRP_MASK >> CAN_NBTP_NBRP_SHIFT)

#define DBTP_MAX_TIME_QUANTA (1U + MAX_DTSEG2 + 1U + MAX_DTSEG1 + 1U)
#define DBTP_MIN_TIME_QUANTA (3U)
#define NBTP_MAX_TIME_QUANTA (1U + MAX_NTSEG2 + 1U + MAX_NTSEG1 + 1U)
#define NBTP_MIN_TIME_QUANTA (3U)

#define MAX_CANFD_BAUDRATE (8000000U)
#define MAX_CAN_BAUDRATE (1000000U)

/*! @brief MCAN Internal State. */
enum _mcan_state
{
    kMCAN_StateIdle     = 0x0, /*!< MB/RxFIFO idle.*/
    kMCAN_StateRxData   = 0x1, /*!< MB receiving.*/
    kMCAN_StateRxRemote = 0x2, /*!< MB receiving remote reply.*/
    kMCAN_StateTxData   = 0x3, /*!< MB transmitting.*/
    kMCAN_StateTxRemote = 0x4, /*!< MB transmitting remote request.*/
    kMCAN_StateRxFifo   = 0x5, /*!< RxFIFO receiving.*/
};

/* Typedef for interrupt handler. */
typedef void (*mcan_isr_t)(CAN_Type *base, mcan_handle_t *handle);

/*******************************************************************************
 * Prototypes
 ******************************************************************************/

/*!
 * @brief Get the MCAN instance from peripheral base address.
 *
 * @param base MCAN peripheral base address.
 * @return MCAN instance.
 */
static uint32_t MCAN_GetInstance(CAN_Type *base);

/*!
 * @brief Reset the MCAN instance.
 *
 * @param base MCAN peripheral base address.
 */
static void MCAN_Reset(CAN_Type *base);

/*!
 * @brief Calculates the segment values for a single bit time for classical CAN
 *
 * @param baudRate The data speed in bps
 * @param tqNum Number of time quantas per bit
 * @param pconfig Pointer to the MCAN timing configuration structure.
 */
static void MCAN_GetSegments(uint32_t baudRate, uint32_t tqNum, mcan_timing_config_t *pconfig);

/*!
 * @brief Set Baud Rate of MCAN.
 *
 * This function set the baud rate of MCAN.
 *
 * @param base MCAN peripheral base address.
 * @param sourceClock_Hz Source Clock in Hz.
 * @param baudRate_Bps Baud Rate in Bps.
 * @param timingConfig MCAN timingConfig.
 */
static void MCAN_SetBaudRate(CAN_Type *base,
                             uint32_t sourceClock_Hz,
                             uint32_t baudRateA_Bps,
                             mcan_timing_config_t timingConfig);

#if (defined(FSL_FEATURE_CAN_SUPPORT_CANFD) && FSL_FEATURE_CAN_SUPPORT_CANFD)
/*!
 * @brief Calculates the segment values for a single bit time for CANFD bus data baud Rate
 *
 * @param baudRate The canfd bus data speed in bps
 * @param tqNum Number of time quanta per bit
 * @param pconfig Pointer to the MCAN timing configuration structure.
 *
 */
static void MCAN_FDGetSegments(uint32_t baudRateFD, uint32_t tqNum, mcan_timing_config_t *pconfig);

/*!
 * @brief Set Baud Rate of MCAN FD.
 *
 * This function set the baud rate of MCAN FD.
 *
 * @param base MCAN peripheral base address.
 * @param sourceClock_Hz Source Clock in Hz.
 * @param baudRateD_Bps Baud Rate in Bps.
 * @param timingConfig MCAN timingConfig.
 */
static void MCAN_SetBaudRateFD(CAN_Type *base,
                               uint32_t sourceClock_Hz,
                               uint32_t baudRateD_Bps,
                               mcan_timing_config_t timingConfig);

#endif /* FSL_FEATURE_CAN_SUPPORT_CANFD */

/*!
 * @brief Get the element's address when read receive fifo 0.
 *
 * @param base MCAN peripheral base address.
 * @return Address of the element in receive fifo 0.
 */
static uint32_t MCAN_GetRxFifo0ElementAddress(CAN_Type *base);

/*!
 * @brief Get the element's address when read receive fifo 1.
 *
 * @param base MCAN peripheral base address.
 * @return Address of the element in receive fifo 1.
 */
static uint32_t MCAN_GetRxFifo1ElementAddress(CAN_Type *base);

/*!
 * @brief Get the element's address when read receive buffer.
 *
 * @param base MCAN peripheral base address.
 * @param idx Number of the erceive buffer element.
 * @return Address of the element in receive buffer.
 */
static uint32_t MCAN_GetRxBufferElementAddress(CAN_Type *base, uint8_t idx);

/*!
 * @brief Get the element's address when read transmit buffer.
 *
 * @param base MCAN peripheral base address.
 * @param idx Number of the transmit buffer element.
 * @return Address of the element in transmit buffer.
 */
static uint32_t MCAN_GetTxBufferElementAddress(CAN_Type *base, uint8_t idx);

/*******************************************************************************
 * Variables
 ******************************************************************************/
/* Array of MCAN handle. */
static mcan_handle_t *s_mcanHandle[FSL_FEATURE_SOC_LPC_CAN_COUNT];

/* Array of MCAN peripheral base address. */
static CAN_Type *const s_mcanBases[] = CAN_BASE_PTRS;

/* Array of MCAN IRQ number. */
static const IRQn_Type s_mcanIRQ[][2] = CAN_IRQS;

#if !(defined(FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL) && FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL)
/* Array of MCAN clock name. */
static const clock_ip_name_t s_mcanClock[] = MCAN_CLOCKS;
#endif /* FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL */

#if !(defined(FSL_FEATURE_MCAN_HAS_NO_RESET) && FSL_FEATURE_MCAN_HAS_NO_RESET)
/*! @brief Pointers to MCAN resets for each instance. */
static const reset_ip_name_t s_mcanResets[] = MCAN_RSTS;
#endif

/* MCAN ISR for transactional APIs. */
static mcan_isr_t s_mcanIsr;

/*******************************************************************************
 * Code
 ******************************************************************************/

static uint32_t MCAN_GetInstance(CAN_Type *base)
{
    uint32_t instance;

    /* Find the instance index from base address mappings. */
    for (instance = 0; instance < ARRAY_SIZE(s_mcanBases); instance++)
    {
        if (s_mcanBases[instance] == base)
        {
            break;
        }
    }

    assert(instance < ARRAY_SIZE(s_mcanBases));

    return instance;
}

static void MCAN_Reset(CAN_Type *base)
{
    /* Set INIT bit. */
    base->CCCR |= CAN_CCCR_INIT_MASK;
    /* Confirm the value has been accepted. */
    while (0U == (base->CCCR & CAN_CCCR_INIT_MASK))
    {
    }

    /* Set CCE bit to have access to the protected configuration registers,
       and clear some status registers. */
    base->CCCR |= CAN_CCCR_CCE_MASK;
}

static void MCAN_SetBaudRate(CAN_Type *base,
                             uint32_t sourceClock_Hz,
                             uint32_t baudRateA_Bps,
                             mcan_timing_config_t timingConfig)
{
    /* MCAN timing setting formula:
     * quantum = 1 + (NTSEG1 + 1) + (NTSEG2 + 1);
     */
    uint32_t quantum = (1U + ((uint32_t)timingConfig.seg1 + 1U) + ((uint32_t)timingConfig.seg2 + 1U));
    uint32_t preDivA = baudRateA_Bps * quantum;

    if (0U == preDivA)
    {
        preDivA = 1U;
    }

    preDivA = (sourceClock_Hz / preDivA) - 1U;

    /* Desired baud rate is too low. */
    if (preDivA > 0x1FFU)
    {
        preDivA = 0x1FFU;
    }

    /* Update actual timing characteristic. */
    MCAN_SetArbitrationTimingConfig(base, &timingConfig);
}

#if (defined(FSL_FEATURE_CAN_SUPPORT_CANFD) && FSL_FEATURE_CAN_SUPPORT_CANFD)
static void MCAN_SetBaudRateFD(CAN_Type *base,
                               uint32_t sourceClock_Hz,
                               uint32_t baudRateD_Bps,
                               mcan_timing_config_t timingConfig)
{
    /* MCAN timing setting formula:
     * quantum = 1 + (NTSEG1 + 1) + (NTSEG2 + 1);
     */
    uint32_t quantum = (1U + ((uint32_t)timingConfig.dataseg1 + 1U) + ((uint32_t)timingConfig.dataseg2 + 1U));
    uint32_t preDivD = baudRateD_Bps * quantum;

    if (0U == preDivD)
    {
        preDivD = 1U;
    }

    preDivD = (sourceClock_Hz / preDivD) - 1U;

    /* Desired baud rate is too low. */
    if (preDivD > 0x1FU)
    {
        preDivD = 0x1FU;
    }

    /* Update actual timing characteristic. */
    MCAN_SetDataTimingConfig(base, &timingConfig);
}
#endif

/*!
 * brief Initializes an MCAN instance.
 *
 * This function initializes the MCAN module with user-defined settings.
 * This example shows how to set up the mcan_config_t parameters and how
 * to call the MCAN_Init function by passing in these parameters.
 *  code
 *   mcan_config_t config;
 *   config->baudRateA = 500000U;
 *   config->baudRateD = 1000000U;
 *   config->enableCanfdNormal = false;
 *   config->enableCanfdSwitch = false;
 *   config->enableLoopBackInt = false;
 *   config->enableLoopBackExt = false;
 *   config->enableBusMon = false;
 *   MCAN_Init(CANFD0, &config, 8000000UL);
 *   endcode
 *
 * param base MCAN peripheral base address.
 * param config Pointer to the user-defined configuration structure.
 * param sourceClock_Hz MCAN Protocol Engine clock source frequency in Hz.
 */
void MCAN_Init(CAN_Type *base, const mcan_config_t *config, uint32_t sourceClock_Hz)
{
#if !(defined(FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL) && FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL)
    /* Enable MCAN clock. */
    CLOCK_EnableClock(s_mcanClock[MCAN_GetInstance(base)]);
#endif /* FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL */

#if !(defined(FSL_FEATURE_MCAN_HAS_NO_RESET) && FSL_FEATURE_MCAN_HAS_NO_RESET)
    /* Reset the MCAN module */
    RESET_PeripheralReset(s_mcanResets[MCAN_GetInstance(base)]);
#endif

    MCAN_Reset(base);

    if (config->enableLoopBackInt)
    {
        base->CCCR |= CAN_CCCR_TEST_MASK | CAN_CCCR_MON_MASK;
        base->TEST |= CAN_TEST_LBCK_MASK;
    }
    if (config->enableLoopBackExt)
    {
        base->CCCR |= CAN_CCCR_TEST_MASK;
        base->TEST |= CAN_TEST_LBCK_MASK;
    }
    if (config->enableBusMon)
    {
        base->CCCR |= CAN_CCCR_MON_MASK;
    }
#if (defined(FSL_FEATURE_CAN_SUPPORT_CANFD) && FSL_FEATURE_CAN_SUPPORT_CANFD)
    if (config->enableCanfdNormal)
    {
        base->CCCR |= CAN_CCCR_FDOE_MASK;
    }
    if (config->enableCanfdSwitch)
    {
        base->CCCR |= CAN_CCCR_FDOE_MASK | CAN_CCCR_BRSE_MASK;
    }
#endif

    /* Set baud rate of arbitration and data phase. */
    MCAN_SetBaudRate(base, sourceClock_Hz, config->baudRateA, config->timingConfig);
#if (defined(FSL_FEATURE_CAN_SUPPORT_CANFD) && FSL_FEATURE_CAN_SUPPORT_CANFD)
    MCAN_SetBaudRateFD(base, sourceClock_Hz, config->baudRateD, config->timingConfig);
#endif
}

/*!
 * brief Deinitializes an MCAN instance.
 *
 * This function deinitializes the MCAN module.
 *
 * param base MCAN peripheral base address.
 */
void MCAN_Deinit(CAN_Type *base)
{
    /* Reset all Register Contents. */
    MCAN_Reset(base);

#if !(defined(FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL) && FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL)
    /* Disable MCAN clock. */
    CLOCK_DisableClock(s_mcanClock[MCAN_GetInstance(base)]);
#endif /* FSL_SDK_DISABLE_DRIVER_CLOCK_CONTROL */
}

/*!
 * brief MCAN enters normal mode.
 *
 * After initialization, INIT bit in CCCR register must be cleared to enter
 * normal mode thus synchronizes to the CAN bus and ready for communication.
 *
 * param base MCAN peripheral base address.
 */
void MCAN_EnterNormalMode(CAN_Type *base)
{
    /* Reset INIT bit to enter normal mode. */
    base->CCCR &= ~CAN_CCCR_INIT_MASK;
    while (0U != (base->CCCR & CAN_CCCR_INIT_MASK))
    {
    }
}

/*!
 * brief Gets the default configuration structure.
 *
 * This function initializes the MCAN configuration structure to default values. The default
 * values are as follows.
 *   config->baudRateA = 500000U;
 *   config->baudRateD = 1000000U;
 *   config->enableCanfdNormal = false;
 *   config->enableCanfdSwitch = false;
 *   config->enableLoopBackInt = false;
 *   config->enableLoopBackExt = false;
 *   config->enableBusMon = false;
 *
 * param config Pointer to the MCAN configuration structure.
 */
void MCAN_GetDefaultConfig(mcan_config_t *config)
{
    /* Assertion. */
    assert(config);

    /* Initializes the configure structure to zero. */
    memset(config, 0, sizeof(*config));

    /* Initialize MCAN Module config struct with default value. */
    config->baudRateA         = 500000U;
    config->baudRateD         = 1000000U;
    config->enableCanfdNormal = false;
    config->enableCanfdSwitch = false;
    config->enableLoopBackInt = false;
    config->enableLoopBackExt = false;
    config->enableBusMon      = false;
    /* Default protocol timing configuration, time quantum is 16. */
    config->timingConfig.seg1       = 0xAU;
    config->timingConfig.seg2       = 0x3U;
    config->timingConfig.rJumpwidth = 0x3U;
#if (defined(FSL_FEATURE_CAN_SUPPORT_CANFD) && FSL_FEATURE_CAN_SUPPORT_CANFD)
    config->timingConfig.dataseg1       = 0xAU;
    config->timingConfig.dataseg2       = 0x3U;
    config->timingConfig.datarJumpwidth = 0x3U;
#endif
}

#if (defined(FSL_FEATURE_CAN_SUPPORT_CANFD) && FSL_FEATURE_CAN_SUPPORT_CANFD)
/*!
 * @brief Calculates the segment values for a single bit time for CANFD bus data baud Rate
 *
 * @param baudRate The canfd bus data speed in bps
 * @param tqNum Number of time quanta per bit
 * @param pconfig Pointer to the MCAN timing configuration structure.
 *
 */
static void MCAN_FDGetSegments(uint32_t baudRateFD, uint32_t tqNum, mcan_timing_config_t *pconfig)
{
    uint32_t ideal_sp;
    uint32_t p1;

    /* get ideal sample point. */
    if (baudRateFD >= 1000000)
        ideal_sp = IDEAL_SP_LOW;
    else if (baudRateFD >= 800000)
        ideal_sp = IDEAL_SP_MID;
    else
        ideal_sp = IDEAL_SP_HIGH;

    /* distribute time quanta. */
    p1                = tqNum * (uint32_t)ideal_sp;
    pconfig->dataseg1 = p1 / IDEAL_SP_FACTOR - 1U;
    if (pconfig->dataseg1 > MAX_DTSEG1)
    {
        pconfig->dataseg1 = MAX_DTSEG1;
    }

    pconfig->dataseg2 = tqNum - (1U + pconfig->dataseg1 + 1U + 1U);

    assert(pconfig->dataseg2 <= MAX_DTSEG2);

    /* subtract one TQ for sync seg. */
    /* sjw is 20% of total TQ, rounded to nearest int. */
    pconfig->datarJumpwidth = (tqNum + (5 - 1)) / 5 - 1U;

    if (pconfig->datarJumpwidth > MAX_DSJW)
    {
        pconfig->datarJumpwidth = MAX_DSJW;
    }
}

/*!
 * @brief Calculates the improved timing values by specific baudrates for CANFD
 *
 * @param baudRate  The CANFD bus control speed in bps defined by user
 * @param baudRateFD  The CANFD bus data speed in bps defined by user
 * @param sourceClock_Hz The Source clock data speed in bps.
 * @param pconfig Pointer to the MCAN timing configuration structure.
 *
 * @return TRUE if timing configuration found, FALSE if failed to find configuration
 */
bool MCAN_FDCalculateImprovedTimingValues(uint32_t baudRate,
                                          uint32_t baudRateFD,
                                          uint32_t sourceClock_Hz,
                                          mcan_timing_config_t *pconfig)
{
    uint32_t clk;
    uint32_t clk2;
    uint32_t tqNum; /* Numbers of TQ. */

    /* observe baud rate maximums */
    assert(baudRate <= MAX_CAN_BAUDRATE);
    assert(baudRateFD <= MAX_CANFD_BAUDRATE);

    /*  Auto Improved Protocal timing for Nominal register. */
    if (MCAN_CalculateImprovedTimingValues(baudRate, sourceClock_Hz, pconfig))
    {
        /* After calculate for Nominal timing, continue to calculate Data timing configuration. */
        for (tqNum = DBTP_MAX_TIME_QUANTA; tqNum >= DBTP_MIN_TIME_QUANTA; tqNum--)
        {
            clk = baudRateFD * tqNum;
            if (clk > sourceClock_Hz)
            {
                continue; /* tqNumbrs too large, clkbrs x tqNumbrs has been exceed sourceClock_Hz. */
            }
            for (pconfig->datapreDivider = 0U; pconfig->datapreDivider <= MAX_DBRP; (pconfig->datapreDivider)++)
            {
                /* Consider some proessor not contain FPU, the parameter need to be exact division. */
                if ((clk / (pconfig->datapreDivider + 1U) * (pconfig->datapreDivider + 1U)) != clk)
                {
                    continue; /* clk need to be exact division by preDivider + 1. */
                }
                clk2 = clk / (pconfig->datapreDivider + 1U);
                if ((sourceClock_Hz / clk2 * clk2) != sourceClock_Hz)
                {
                    continue; /* sourceClock_Hz need to be exact division by preDivider. */
                }
                MCAN_FDGetSegments(baudRateFD, tqNum, pconfig);
                return true;
            }
        }
    }

    /* failed to find solution. */
    return false;
}

/*!
 * brief Sets the MCAN protocol data phase timing characteristic.
 *
 * This function gives user settings to CAN bus timing characteristic.
 * The function is for an experienced user. For less experienced users, call
 * the MCAN_Init() and fill the baud rate field with a desired value.
 * This provides the default data phase timing characteristics.
 *
 * Note that calling MCAN_SetArbitrationTimingConfig() overrides the baud rate
 * set in MCAN_Init().
 *
 * param base MCAN peripheral base address.
 * param config Pointer to the timing configuration structure.
 */
void MCAN_SetDataTimingConfig(CAN_Type *base, const mcan_timing_config_t *config)
{
    /* Assertion. */
    assert(config);

    /* Cleaning previous Timing Setting. */
    base->DBTP &= ~(CAN_DBTP_DSJW_MASK | CAN_DBTP_DTSEG2_MASK | CAN_DBTP_DTSEG1_MASK | CAN_DBTP_DBRP_MASK);

    /* Updating Timing Setting according to configuration structure. */
    base->DBTP |= (CAN_DBTP_DBRP(config->datapreDivider) | CAN_DBTP_DSJW(config->datarJumpwidth) |
                   CAN_DBTP_DTSEG1(config->dataseg1) | CAN_DBTP_DTSEG2(config->dataseg2));
}
#endif /* FSL_FEATURE_CAN_SUPPORT_CANFD */

/*!
 * @brief Calculates the segment values for a single bit time for classical CAN
 *
 * @param baudRate The data speed in bps
 * @param tqNum Number of time quantas per bit
 * @param pconfig Pointer to the MCAN timing configuration structure.
 */
static void MCAN_GetSegments(uint32_t baudRate, uint32_t tqNum, mcan_timing_config_t *pconfig)
{
    uint32_t ideal_sp;
    uint32_t p1;

    /* get ideal sample point. */
    if (baudRate >= 1000000)
        ideal_sp = IDEAL_SP_LOW;
    else if (baudRate >= 800000)
        ideal_sp = IDEAL_SP_MID;
    else
        ideal_sp = IDEAL_SP_HIGH;

    /* distribute time quanta. */
    p1            = tqNum * (uint32_t)ideal_sp;
    pconfig->seg1 = p1 / IDEAL_SP_FACTOR - 1U;

    pconfig->seg2 = tqNum - (1U + pconfig->seg1 + 1U + 1U);
    assert(pconfig->seg2 <= MAX_NTSEG2);

    /* subtract one TQ for sync seg. */
    /* sjw is 20% of total TQ, rounded to nearest int. */
    pconfig->rJumpwidth = (tqNum + (5 - 1)) / 5 - 1U;
}

/*!
 * @brief Calculates the improved timing values by specific baudrates for classical CAN
 *
 * @param baudRate  The classical CAN speed in bps defined by user
 * @param sourceClock_Hz The Source clock data speed in bps. Zero to disable baudrate switching
 * @param pconfig Pointer to the MCAN timing configuration structure.
 *
 * @return TRUE if timing configuration found, FALSE if failed to find configuration
 */
bool MCAN_CalculateImprovedTimingValues(uint32_t baudRate, uint32_t sourceClock_Hz, mcan_timing_config_t *pconfig)
{
    uint32_t clk;   /* the clock is tqNumb x baudRateFD. */
    uint32_t clk2;  /* the clock2 is clk2 / Pre-scaler Division Factor. */
    uint32_t tqNum; /* Numbers of TQ. */

    /* observe baud rate maximums. */
    assert(baudRate <= MAX_CAN_BAUDRATE);

    /*  Auto Improved Protocal timing for CBT. */
    for (tqNum = NBTP_MAX_TIME_QUANTA; tqNum >= NBTP_MIN_TIME_QUANTA; tqNum--)
    {
        clk = baudRate * tqNum;
        if (clk > sourceClock_Hz)
        {
            continue; /* tqNum too large, clk has been exceed sourceClock_Hz. */
        }

        for (pconfig->preDivider = 0x0U; pconfig->preDivider <= MAX_NBRP; (pconfig->preDivider)++)
        {
            /* Consider some proessor not contain FPU, the parameter need to be exact division. */
            if ((clk / (pconfig->preDivider + 1U) * (pconfig->preDivider + 1U)) != clk)
            {
                continue; /* clk need to be exact division by preDivider + 1. */
            }
            clk2 = clk / (pconfig->preDivider + 1U);
            if (((sourceClock_Hz / clk2) * clk2) != sourceClock_Hz)
            {
                continue; /* sourceClock_Hz need to be exact division by preDivider. */
            }
            MCAN_GetSegments(baudRate, tqNum, pconfig);
            return true;
        }
    }
    /* failed to find solution. */
    return false;
}

/*!
 * brief Sets the MCAN protocol arbitration phase timing characteristic.
 *
 * This function gives user settings to CAN bus timing characteristic.
 * The function is for an experienced user. For less experienced users, call
 * the MCAN_Init() and fill the baud rate field with a desired value.
 * This provides the default arbitration phase timing characteristics.
 *
 * Note that calling MCAN_SetArbitrationTimingConfig() overrides the baud rate
 * set in MCAN_Init().
 *
 * param base MCAN peripheral base address.
 * param config Pointer to the timing configuration structure.
 */
void MCAN_SetArbitrationTimingConfig(CAN_Type *base, const mcan_timing_config_t *config)
{
    /* Assertion. */
    assert(config);

    /* Cleaning previous Timing Setting. */
    base->NBTP &= ~(CAN_NBTP_NSJW_MASK | CAN_NBTP_NTSEG2_MASK | CAN_NBTP_NTSEG1_MASK | CAN_NBTP_NBRP_MASK);

    /* Updating Timing Setting according to configuration structure. */
    base->NBTP |= (CAN_NBTP_NBRP(config->preDivider) | CAN_NBTP_NSJW(config->rJumpwidth) |
                   CAN_NBTP_NTSEG1(config->seg1) | CAN_NBTP_NTSEG2(config->seg2));
}

/*!
 * brief Set filter configuration.
 *
 * This function sets remote and non masking frames in global filter configuration,
 * also the start address, list size in standard/extended ID filter configuration.
 *
 * param base MCAN peripheral base address.
 * param config The MCAN filter configuration.
 */
void MCAN_SetFilterConfig(CAN_Type *base, const mcan_frame_filter_config_t *config)
{
    /* Set global configuration of remote/nonmasking frames, set filter address and list size. */
    if (config->idFormat == kMCAN_FrameIDStandard)
    {
        base->GFC |= CAN_GFC_RRFS(config->remFrame) | CAN_GFC_ANFS(config->nmFrame);
        base->SIDFC |= CAN_SIDFC_FLSSA(config->address >> CAN_SIDFC_FLSSA_SHIFT) | CAN_SIDFC_LSS(config->listSize);
    }
    else
    {
        base->GFC |= CAN_GFC_RRFE(config->remFrame) | CAN_GFC_ANFE(config->nmFrame);
        base->XIDFC |= CAN_XIDFC_FLESA(config->address >> CAN_XIDFC_FLESA_SHIFT) | CAN_XIDFC_LSE(config->listSize);
    }
}

/*!
 * brief Configures an MCAN receive fifo 0 buffer.
 *
 * This function sets start address, element size, watermark, operation mode
 * and datafield size of the recieve fifo 0.
 *
 * param base MCAN peripheral base address.
 * param config The receive fifo 0 configuration structure.
 */
void MCAN_SetRxFifo0Config(CAN_Type *base, const mcan_rx_fifo_config_t *config)
{
    /* Set Rx FIFO 0 start address, element size, watermark, operation mode. */
    base->RXF0C |= CAN_RXF0C_F0SA(config->address >> CAN_RXF0C_F0SA_SHIFT) | CAN_RXF0C_F0S(config->elementSize) |
                   CAN_RXF0C_F0WM(config->watermark) | CAN_RXF0C_F0OM(config->opmode);
    /* Set Rx FIFO 0 data field size */
    base->RXESC |= CAN_RXESC_F0DS(config->datafieldSize);
}

/*!
 * brief Configures an MCAN receive fifo 1 buffer.
 *
 * This function sets start address, element size, watermark, operation mode
 * and datafield size of the recieve fifo 1.
 *
 * param base MCAN peripheral base address.
 * param config The receive fifo 1 configuration structure.
 */
void MCAN_SetRxFifo1Config(CAN_Type *base, const mcan_rx_fifo_config_t *config)
{
    /* Set Rx FIFO 1 start address, element size, watermark, operation mode. */
    base->RXF1C |= CAN_RXF1C_F1SA(config->address >> CAN_RXF1C_F1SA_SHIFT) | CAN_RXF1C_F1S(config->elementSize) |
                   CAN_RXF1C_F1WM(config->watermark) | CAN_RXF1C_F1OM(config->opmode);
    /* Set Rx FIFO 1 data field size */
    base->RXESC |= CAN_RXESC_F1DS(config->datafieldSize);
}

/*!
 * brief Configures an MCAN receive buffer.
 *
 * This function sets start address and datafield size of the recieve buffer.
 *
 * param base MCAN peripheral base address.
 * param config The receive buffer configuration structure.
 */
void MCAN_SetRxBufferConfig(CAN_Type *base, const mcan_rx_buffer_config_t *config)
{
    /* Set Rx Buffer start address. */
    base->RXBC |= CAN_RXBC_RBSA(config->address >> CAN_RXBC_RBSA_SHIFT);
    /* Set Rx Buffer data field size */
    base->RXESC |= CAN_RXESC_RBDS(config->datafieldSize);
}

/*!
 * brief Configures an MCAN transmit event fifo.
 *
 * This function sets start address, element size, watermark of the transmit event fifo.
 *
 * param base MCAN peripheral base address.
 * param config The transmit event fifo configuration structure.
 */
void MCAN_SetTxEventFifoConfig(CAN_Type *base, const mcan_tx_fifo_config_t *config)
{
    /* Set TX Event FIFO start address, element size, watermark. */
    base->TXEFC |= CAN_TXEFC_EFSA(config->address >> CAN_TXEFC_EFSA_SHIFT) | CAN_TXEFC_EFS(config->elementSize) |
                   CAN_TXEFC_EFWM(config->watermark);
}

/*!
 * brief Configures an MCAN transmit buffer.
 *
 * This function sets start address, element size, fifo/queue mode and datafield
 * size of the transmit buffer.
 *
 * param base MCAN peripheral base address.
 * param config The transmit buffer configuration structure.
 */
void MCAN_SetTxBufferConfig(CAN_Type *base, const mcan_tx_buffer_config_t *config)
{
    assert((config->dedicatedSize + config->fqSize) <= 32U);

    /* Set Tx Buffer start address, size, fifo/queue mode. */
    base->TXBC |= CAN_TXBC_TBSA(config->address >> CAN_TXBC_TBSA_SHIFT) | CAN_TXBC_NDTB(config->dedicatedSize) |
                  CAN_TXBC_TFQS(config->fqSize) | CAN_TXBC_TFQM(config->mode);
    /* Set Tx Buffer data field size */
    base->TXESC |= CAN_TXESC_TBDS(config->datafieldSize);
}

/*!
 * brief Set filter configuration.
 *
 * This function sets remote and non masking frames in global filter configuration,
 * also the start address, list size in standard/extended ID filter configuration.
 *
 * param base MCAN peripheral base address.
 * param config The MCAN filter configuration.
 */
void MCAN_SetSTDFilterElement(CAN_Type *base,
                              const mcan_frame_filter_config_t *config,
                              const mcan_std_filter_element_config_t *filter,
                              uint8_t idx)
{
    uint32_t *elementAddress = NULL;
    elementAddress           = (uint32_t *)(MCAN_GetMsgRAMBase(base) + config->address + idx * 4U);
    memcpy(elementAddress, filter, sizeof(mcan_std_filter_element_config_t));
}

/*!
 * brief Set filter configuration.
 *
 * This function sets remote and non masking frames in global filter configuration,
 * also the start address, list size in standard/extended ID filter configuration.
 *
 * param base MCAN peripheral base address.
 * param config The MCAN filter configuration.
 */
void MCAN_SetEXTFilterElement(CAN_Type *base,
                              const mcan_frame_filter_config_t *config,
                              const mcan_ext_filter_element_config_t *filter,
                              uint8_t idx)
{
    uint32_t *elementAddress = NULL;
    elementAddress           = (uint32_t *)(MCAN_GetMsgRAMBase(base) + config->address + idx * 8U);
    memcpy(elementAddress, filter, sizeof(mcan_ext_filter_element_config_t));
}

static uint32_t MCAN_GetRxFifo0ElementAddress(CAN_Type *base)
{
    uint32_t eSize;
    eSize = (base->RXESC & CAN_RXESC_F0DS_MASK) >> CAN_RXESC_F0DS_SHIFT;
    if (eSize < 5U)
    {
        eSize += 4U;
    }
    else
    {
        eSize = eSize * 4U - 10U;
    }
    return (base->RXF0C & CAN_RXF0C_F0SA_MASK) +
           ((base->RXF0S & CAN_RXF0S_F0GI_MASK) >> CAN_RXF0S_F0GI_SHIFT) * eSize * 4U;
}

static uint32_t MCAN_GetRxFifo1ElementAddress(CAN_Type *base)
{
    uint32_t eSize;
    eSize = (base->RXESC & CAN_RXESC_F1DS_MASK) >> CAN_RXESC_F1DS_SHIFT;
    if (eSize < 5U)
    {
        eSize += 4U;
    }
    else
    {
        eSize = eSize * 4U - 10U;
    }
    return (base->RXF1C & CAN_RXF1C_F1SA_MASK) +
           ((base->RXF1S & CAN_RXF1S_F1GI_MASK) >> CAN_RXF1S_F1GI_SHIFT) * eSize * 4U;
}

static uint32_t MCAN_GetRxBufferElementAddress(CAN_Type *base, uint8_t idx)
{
    assert(idx <= 63U);
    uint32_t eSize;
    eSize = (base->RXESC & CAN_RXESC_RBDS_MASK) >> CAN_RXESC_RBDS_SHIFT;
    if (eSize < 5U)
    {
        eSize += 4U;
    }
    else
    {
        eSize = eSize * 4U - 10U;
    }
    return (base->RXBC & CAN_RXBC_RBSA_MASK) + idx * eSize * 4U;
}

static uint32_t MCAN_GetTxBufferElementAddress(CAN_Type *base, uint8_t idx)
{
    assert(idx <= 31U);
    uint32_t eSize;
    eSize = (base->TXESC & CAN_TXESC_TBDS_MASK) >> CAN_TXESC_TBDS_SHIFT;
    if (eSize < 5U)
    {
        eSize += 4U;
    }
    else
    {
        eSize = eSize * 4U - 10U;
    }
    return (base->TXBC & CAN_TXBC_TBSA_MASK) + idx * eSize * 4U;
}

/*!
 * brief Gets the Tx buffer request pending status.
 *
 * This function returns Tx Message Buffer transmission request pending status.
 *
 * param base MCAN peripheral base address.
 * param idx The MCAN Tx Buffer index.
 */
uint32_t MCAN_IsTransmitRequestPending(CAN_Type *base, uint8_t idx)
{
    return (base->TXBRP & (uint32_t)(1U << idx)) >> (uint32_t)idx;
}

/*!
 * brief Gets the Tx buffer transmission occurred status.
 *
 * This function returns Tx Message Buffer transmission occurred status.
 *
 * param base MCAN peripheral base address.
 * param idx The MCAN Tx Buffer index.
 */
uint32_t MCAN_IsTransmitOccurred(CAN_Type *base, uint8_t idx)
{
    return (base->TXBTO & (uint32_t)(1U << idx)) >> (uint32_t)idx;
}

/*!
 * brief Writes an MCAN Message to the Transmit Buffer.
 *
 * This function writes a CAN Message to the specified Transmit Message Buffer
 * and changes the Message Buffer state to start CAN Message transmit. After
 * that the function returns immediately.
 *
 * param base MCAN peripheral base address.
 * param idx The MCAN Tx Buffer index.
 * param txFrame Pointer to CAN message frame to be sent.
 */
status_t MCAN_WriteTxBuffer(CAN_Type *base, uint8_t idx, const mcan_tx_buffer_frame_t *txFrame)
{
    /* Assertion. */
    assert(NULL != txFrame);

    if (!MCAN_IsTransmitRequestPending(base, idx))
    {
        uint8_t *elementAddress = NULL;
        elementAddress          = (uint8_t *)(MCAN_GetMsgRAMBase(base) + MCAN_GetTxBufferElementAddress(base, idx));

        /* Write 2 words configuration field. */
        memcpy(elementAddress, (const uint8_t *)txFrame, 8U);
        /* Write data field. */
        memcpy(elementAddress + 8U, txFrame->data, txFrame->size);
        return kStatus_Success;
    }
    else
    {
        return kStatus_Fail;
    }
}

/*!
 * brief Reads an MCAN Message from Rx Buffer.
 *
 * This function reads a CAN message from the Rx Buffer in the Message RAM.
 *
 * param base MCAN peripheral base address.
 * param idx The MCAN Rx Buffer index.
 * param rxFrame Pointer to CAN message frame structure for reception.
 * retval kStatus_Success - Read Message from Rx Buffer successfully.
 */
status_t MCAN_ReadRxBuffer(CAN_Type *base, uint8_t idx, mcan_rx_buffer_frame_t *rxFrame)
{
    /* Assertion. */
    assert(NULL != rxFrame);

    mcan_rx_buffer_frame_t *elementAddress = NULL;
    elementAddress = (mcan_rx_buffer_frame_t *)(MCAN_GetMsgRAMBase(base) + MCAN_GetRxBufferElementAddress(base, idx));
    memcpy(rxFrame, elementAddress, (rxFrame->size + 8U));
    return kStatus_Success;
}

/*!
 * brief Reads an MCAN Message from Rx FIFO.
 *
 * This function reads a CAN message from the Rx FIFO in the Message RAM.
 *
 * param base MCAN peripheral base address.
 * param fifoBlock Rx FIFO block 0 or 1.
 * param rxFrame Pointer to CAN message frame structure for reception.
 * retval kStatus_Success - Read Message from Rx FIFO successfully.
 */
status_t MCAN_ReadRxFifo(CAN_Type *base, uint8_t fifoBlock, mcan_rx_buffer_frame_t *rxFrame)
{
    /* Assertion. */
    assert((0U == fifoBlock) || (1U == fifoBlock));
    assert(NULL != rxFrame);

    mcan_rx_buffer_frame_t *elementAddress = NULL;
    if (0U == fifoBlock)
    {
        elementAddress = (mcan_rx_buffer_frame_t *)(MCAN_GetMsgRAMBase(base) + MCAN_GetRxFifo0ElementAddress(base));
    }
    else
    {
        elementAddress = (mcan_rx_buffer_frame_t *)(MCAN_GetMsgRAMBase(base) + MCAN_GetRxFifo1ElementAddress(base));
    }
    memcpy(rxFrame, elementAddress, 8U);
    rxFrame->data = (uint8_t *)elementAddress + 8U;
    /* Acknowledge the read. */
    if (0U == fifoBlock)
    {
        base->RXF0A = (base->RXF0S & CAN_RXF0S_F0GI_MASK) >> CAN_RXF0S_F0GI_SHIFT;
    }
    else
    {
        base->RXF1A = (base->RXF1S & CAN_RXF1S_F1GI_MASK) >> CAN_RXF1S_F1GI_SHIFT;
    }
    return kStatus_Success;
}

/*!
 * brief Performs a polling send transaction on the CAN bus.
 *
 * Note that a transfer handle does not need to be created  before calling this API.
 *
 * param base MCAN peripheral base pointer.
 * param idx The MCAN buffer index.
 * param txFrame Pointer to CAN message frame to be sent.
 * retval kStatus_Success - Write Tx Message Buffer Successfully.
 * retval kStatus_Fail    - Tx Message Buffer is currently in use.
 */
status_t MCAN_TransferSendBlocking(CAN_Type *base, uint8_t idx, mcan_tx_buffer_frame_t *txFrame)
{
    if (kStatus_Success == MCAN_WriteTxBuffer(base, idx, txFrame))
    {
        MCAN_TransmitAddRequest(base, idx);

        /* Wait until message sent out. */
        while (!MCAN_IsTransmitOccurred(base, idx))
        {
        }
        return kStatus_Success;
    }
    else
    {
        return kStatus_Fail;
    }
}

/*!
 * brief Performs a polling receive transaction on the CAN bus.
 *
 * Note that a transfer handle does not need to be created  before calling this API.
 *
 * param base MCAN peripheral base pointer.
 * param idx The MCAN buffer index.
 * param rxFrame Pointer to CAN message frame structure for reception.
 * retval kStatus_Success - Read Rx Message Buffer Successfully.
 * retval kStatus_Fail    - No new message.
 */
status_t MCAN_TransferReceiveBlocking(CAN_Type *base, uint8_t bufferIdx, mcan_rx_buffer_frame_t *rxFrame)
{
    assert(bufferIdx <= 63U);

#if (defined(MCAN_RETRY_TIMES) && MCAN_RETRY_TIMES)
    uint32_t u4Retry = MCAN_RETRY_TIMES;
#endif

    while (!MCAN_GetRxBufferStatusFlag(base, bufferIdx))
    {
#if (defined(MCAN_RETRY_TIMES) && MCAN_RETRY_TIMES)
        if (0U == u4Retry--)
        {
            return kStatus_Fail;
        }
#endif
    }
    MCAN_ClearRxBufferStatusFlag(base, bufferIdx);
    return MCAN_ReadRxBuffer(base, bufferIdx, rxFrame);
}

/*!
 * brief Performs a polling receive transaction from Rx FIFO on the CAN bus.
 *
 * Note that a transfer handle does not need to be created before calling this API.
 *
 * param base MCAN peripheral base pointer.
 * param fifoBlock Rx FIFO block, 0 or 1.
 * param rxFrame Pointer to CAN message frame structure for reception.
 * retval kStatus_Success - Read Message from Rx FIFO successfully.
 * retval kStatus_Fail    - No new message in Rx FIFO.
 */
status_t MCAN_TransferReceiveFifoBlocking(CAN_Type *base, uint8_t fifoBlock, mcan_rx_buffer_frame_t *rxFrame)
{
    assert((0U == fifoBlock) || (1U == fifoBlock));

#if (defined(MCAN_RETRY_TIMES) && MCAN_RETRY_TIMES)
    uint32_t u4Retry = MCAN_RETRY_TIMES;
#endif

    if (0 == fifoBlock)
    {
        while (!MCAN_GetStatusFlag(base, CAN_IR_RF0N_MASK))
        {
#if (defined(MCAN_RETRY_TIMES) && MCAN_RETRY_TIMES)
            if (0U == u4Retry--)
            {
                return kStatus_Fail;
            }
#endif
        }
        MCAN_ClearStatusFlag(base, CAN_IR_RF0N_MASK);
    }
    else
    {
        while (!MCAN_GetStatusFlag(base, CAN_IR_RF1N_MASK))
        {
#if (defined(MCAN_RETRY_TIMES) && MCAN_RETRY_TIMES)
            if (0U == u4Retry--)
            {
                return kStatus_Fail;
            }
#endif
        }
        MCAN_ClearStatusFlag(base, CAN_IR_RF1N_MASK);
    }
    return MCAN_ReadRxFifo(base, fifoBlock, rxFrame);
}

/*!
 * brief Initializes the MCAN handle.
 *
 * This function initializes the MCAN handle, which can be used for other MCAN
 * transactional APIs. Usually, for a specified MCAN instance,
 * call this API once to get the initialized handle.
 *
 * param base MCAN peripheral base address.
 * param handle MCAN handle pointer.
 * param callback The callback function.
 * param userData The parameter of the callback function.
 */
void MCAN_TransferCreateHandle(CAN_Type *base, mcan_handle_t *handle, mcan_transfer_callback_t callback, void *userData)
{
    assert(NULL != handle);

    uint8_t instance;

    /* Clean MCAN transfer handle. */
    memset(handle, 0, sizeof(*handle));

    /* Get instance from peripheral base address. */
    instance = MCAN_GetInstance(base);

    /* Save the context in global variables to support the double weak mechanism. */
    s_mcanHandle[instance] = handle;

    /* Register Callback function. */
    handle->callback = callback;
    handle->userData = userData;

    s_mcanIsr = MCAN_TransferHandleIRQ;

    /* We Enable Error & Status interrupt here, because this interrupt just
     * report current status of MCAN module through Callback function.
     * It is insignificance without a available callback function.
     */
    if (handle->callback != NULL)
    {
        MCAN_EnableInterrupts(base, 0U,
                              kMCAN_BusOffInterruptEnable | kMCAN_ErrorInterruptEnable | kMCAN_WarningInterruptEnable);
    }
    else
    {
        MCAN_DisableInterrupts(base,
                               kMCAN_BusOffInterruptEnable | kMCAN_ErrorInterruptEnable | kMCAN_WarningInterruptEnable);
    }

    /* Enable interrupts in NVIC. */
    EnableIRQ((IRQn_Type)(s_mcanIRQ[instance][0]));
    EnableIRQ((IRQn_Type)(s_mcanIRQ[instance][1]));
}

/*!
 * brief Sends a message using IRQ.
 *
 * This function sends a message using IRQ. This is a non-blocking function, which returns
 * right away. When messages have been sent out, the send callback function is called.
 *
 * param base MCAN peripheral base address.
 * param handle MCAN handle pointer.
 * param xfer MCAN Buffer transfer structure. See the #mcan_buffer_transfer_t.
 * retval kStatus_Success        Start Tx Buffer sending process successfully.
 * retval kStatus_Fail           Write Tx Buffer failed.
 * retval kStatus_MCAN_TxBusy Tx Buffer is in use.
 */
status_t MCAN_TransferSendNonBlocking(CAN_Type *base, mcan_handle_t *handle, mcan_buffer_transfer_t *xfer)
{
    /* Assertion. */
    assert(NULL != handle);
    assert(NULL != xfer);
    assert(xfer->bufferIdx <= 63U);

    /* Check if Tx Buffer is idle. */
    if (kMCAN_StateIdle == handle->bufferState[xfer->bufferIdx])
    {
        handle->txbufferIdx = xfer->bufferIdx;
        /* Distinguish transmit type. */
        if (kMCAN_FrameTypeRemote == xfer->frame->xtd)
        {
            handle->bufferState[xfer->bufferIdx] = kMCAN_StateTxRemote;

            /* Register user Frame buffer to receive remote Frame. */
            handle->bufferFrameBuf[xfer->bufferIdx] = xfer->frame;
        }
        else
        {
            handle->bufferState[xfer->bufferIdx] = kMCAN_StateTxData;
        }

        if (kStatus_Success == MCAN_WriteTxBuffer(base, xfer->bufferIdx, xfer->frame))
        {
            /* Enable Buffer Interrupt. */
            MCAN_EnableTransmitBufferInterrupts(base, xfer->bufferIdx);
            MCAN_EnableInterrupts(base, 0U, CAN_IE_TCE_MASK);

            MCAN_TransmitAddRequest(base, xfer->bufferIdx);

            return kStatus_Success;
        }
        else
        {
            handle->bufferState[xfer->bufferIdx] = kMCAN_StateIdle;
            return kStatus_Fail;
        }
    }
    else
    {
        return kStatus_MCAN_TxBusy;
    }
}

/*!
 * brief Receives a message from Rx FIFO using IRQ.
 *
 * This function receives a message using IRQ. This is a non-blocking function, which returns
 * right away. When all messages have been received, the receive callback function is called.
 *
 * param base MCAN peripheral base address.
 * param handle MCAN handle pointer.
 * param fifoBlock Rx FIFO block, 0 or 1.
 * param xfer MCAN Rx FIFO transfer structure. See the ref mcan_fifo_transfer_t.
 * retval kStatus_Success            - Start Rx FIFO receiving process successfully.
 * retval kStatus_MCAN_RxFifo0Busy - Rx FIFO 0 is currently in use.
 * retval kStatus_MCAN_RxFifo1Busy - Rx FIFO 1 is currently in use.
 */
status_t MCAN_TransferReceiveFifoNonBlocking(CAN_Type *base,
                                             uint8_t fifoBlock,
                                             mcan_handle_t *handle,
                                             mcan_fifo_transfer_t *xfer)
{
    /* Assertion. */
    assert((0 == fifoBlock) || (1U == fifoBlock));
    assert(NULL != handle);
    assert(NULL != xfer);

    /* Check if Message Buffer is idle. */
    if (kMCAN_StateIdle == handle->rxFifoState)
    {
        handle->rxFifoState = kMCAN_StateRxFifo;

        /* Register Message Buffer. */
        handle->rxFifoFrameBuf = xfer->frame;

        /* Enable FIFO Interrupt. */
        if (fifoBlock)
        {
            MCAN_EnableInterrupts(base, 0U, CAN_IE_RF1NE_MASK);
        }
        else
        {
            MCAN_EnableInterrupts(base, 0U, CAN_IE_RF0NE_MASK);
        }
        return kStatus_Success;
    }
    else
    {
        return fifoBlock ? kStatus_MCAN_RxFifo1Busy : kStatus_MCAN_RxFifo0Busy;
    }
}

/*!
 * brief Aborts the interrupt driven message send process.
 *
 * This function aborts the interrupt driven message send process.
 *
 * param base MCAN peripheral base address.
 * param handle MCAN handle pointer.
 * param bufferIdx The MCAN Buffer index.
 */
void MCAN_TransferAbortSend(CAN_Type *base, mcan_handle_t *handle, uint8_t bufferIdx)
{
    /* Assertion. */
    assert(NULL != handle);
    assert(bufferIdx <= 63U);

    /* Disable Buffer Interrupt. */
    MCAN_DisableTransmitBufferInterrupts(base, bufferIdx);
    MCAN_DisableInterrupts(base, CAN_IE_TCE_MASK);

    /* Cancel send request. */
    MCAN_TransmitCancelRequest(base, bufferIdx);

    /* Un-register handle. */
    handle->bufferFrameBuf[bufferIdx] = NULL;

    handle->bufferState[bufferIdx] = kMCAN_StateIdle;
}

/*!
 * brief Aborts the interrupt driven message receive from Rx FIFO process.
 *
 * This function aborts the interrupt driven message receive from Rx FIFO process.
 *
 * param base MCAN peripheral base address.
 * param fifoBlock MCAN Fifo block, 0 or 1.
 * param handle MCAN handle pointer.
 */
void MCAN_TransferAbortReceiveFifo(CAN_Type *base, uint8_t fifoBlock, mcan_handle_t *handle)
{
    /* Assertion. */
    assert(NULL != handle);
    assert((0U == fifoBlock) || (1U == fifoBlock));

    /* Check if Rx FIFO is enabled. */
    if (1U == fifoBlock)
    {
        /* Disable Rx Message FIFO Interrupts. */
        MCAN_DisableInterrupts(base, CAN_IE_RF1NE_MASK);
    }
    else
    {
        MCAN_DisableInterrupts(base, CAN_IE_RF0NE_MASK);
    }
    /* Un-register handle. */
    handle->rxFifoFrameBuf = NULL;

    handle->rxFifoState = kMCAN_StateIdle;
}

/*!
 * brief MCAN IRQ handle function.
 *
 * This function handles the MCAN Error, the Buffer, and the Rx FIFO IRQ request.
 *
 * param base MCAN peripheral base address.
 * param handle MCAN handle pointer.
 */
void MCAN_TransferHandleIRQ(CAN_Type *base, mcan_handle_t *handle)
{
    /* Assertion. */
    assert(NULL != handle);

    status_t status = kStatus_MCAN_UnHandled;
    uint32_t result;

    /* Store Current MCAN Module Error and Status. */
    result = base->IR;

    do
    {
        /* Solve Rx FIFO, Tx interrupt. */
        if (result & kMCAN_TxTransmitCompleteFlag)
        {
            status = kStatus_MCAN_TxIdle;
            MCAN_TransferAbortSend(base, handle, handle->txbufferIdx);
        }
        else if (result & kMCAN_RxFifo0NewFlag)
        {
            MCAN_ReadRxFifo(base, 0U, handle->rxFifoFrameBuf);
            status = kStatus_MCAN_RxFifo0Idle;
            MCAN_TransferAbortReceiveFifo(base, 0U, handle);
        }
        else if (result & kMCAN_RxFifo0LostFlag)
        {
            status = kStatus_MCAN_RxFifo0Lost;
        }
        else if (result & kMCAN_RxFifo1NewFlag)
        {
            MCAN_ReadRxFifo(base, 1U, handle->rxFifoFrameBuf);
            status = kStatus_MCAN_RxFifo1Idle;
            MCAN_TransferAbortReceiveFifo(base, 1U, handle);
        }
        else if (result & kMCAN_RxFifo1LostFlag)
        {
            status = kStatus_MCAN_RxFifo0Lost;
        }
        else
        {
            ;
        }

        /* Clear resolved Rx FIFO, Tx Buffer IRQ. */
        MCAN_ClearStatusFlag(base, result);

        /* Calling Callback Function if has one. */
        if (handle->callback != NULL)
        {
            handle->callback(base, handle, status, result, handle->userData);
        }

        /* Reset return status */
        status = kStatus_MCAN_UnHandled;

        /* Store Current MCAN Module Error and Status. */
        result = base->IR;
    } while ((0U != MCAN_GetStatusFlag(base, 0xFFFFFFFFU)) ||
             (0U != (result & (kMCAN_ErrorWarningIntFlag | kMCAN_BusOffIntFlag | kMCAN_ErrorPassiveIntFlag))));
}

#if defined(CAN0)
void CAN0_IRQ0_DriverIRQHandler(void)
{
    assert(s_mcanHandle[0]);

    s_mcanIsr(CAN0, s_mcanHandle[0]);
/* Add for ARM errata 838869, affects Cortex-M4, Cortex-M4F Store immediate overlapping
  exception return operation might vector to incorrect interrupt */
#if defined __CORTEX_M && (__CORTEX_M == 4U)
    __DSB();
#endif
}

void CAN0_IRQ1_DriverIRQHandler(void)
{
    assert(s_mcanHandle[0]);

    s_mcanIsr(CAN0, s_mcanHandle[0]);
/* Add for ARM errata 838869, affects Cortex-M4, Cortex-M4F Store immediate overlapping
  exception return operation might vector to incorrect interrupt */
#if defined __CORTEX_M && (__CORTEX_M == 4U)
    __DSB();
#endif
}
#endif

#if defined(CAN1)
void CAN1_IRQ0_DriverIRQHandler(void)
{
    assert(s_mcanHandle[1]);

    s_mcanIsr(CAN1, s_mcanHandle[1]);
/* Add for ARM errata 838869, affects Cortex-M4, Cortex-M4F Store immediate overlapping
  exception return operation might vector to incorrect interrupt */
#if defined __CORTEX_M && (__CORTEX_M == 4U)
    __DSB();
#endif
}

void CAN1_IRQ1_DriverIRQHandler(void)
{
    assert(s_mcanHandle[1]);

    s_mcanIsr(CAN1, s_mcanHandle[1]);
/* Add for ARM errata 838869, affects Cortex-M4, Cortex-M4F Store immediate overlapping
  exception return operation might vector to incorrect interrupt */
#if defined __CORTEX_M && (__CORTEX_M == 4U)
    __DSB();
#endif
}
#endif
