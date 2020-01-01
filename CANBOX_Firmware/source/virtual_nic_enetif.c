/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016 - 2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */
#include "virtual_nic_enetif.h"

#include "fsl_enet.h"
#include "fsl_phy.h"
#include "usb_device_config.h"
#include "usb.h"
#include "usb_device.h"

#include "usb_device_class.h"
#include "usb_device_cdc_acm.h"
#include "usb_device_cdc_rndis.h"
#include "usb_device_ch9.h"
#include "usb_device_descriptor.h"

#include "virtual_nic_enet_adapter.h"
/*******************************************************************************
 * Definitions
 ******************************************************************************/
/*******************************************************************************
 * Prototypes
 ******************************************************************************/
void ENETIF_Input(enet_handle_t *handle, uint8_t channel, void *param);
void VNIC_EnetCallback(pbuf_t *pbuffer);
void VNIC_EnetRxBufFree(pbuf_t *pbuf);
uint8_t *VNIC_EnetRxBufAlloc(void);
usb_status_t VNIC_EnetTxDone(void);
/*******************************************************************************
 * Variables
 ******************************************************************************/
enet_handle_t g_handle;
uint8_t g_hwaddr[ENET_MAC_ADDR_SIZE];


#if defined(__ICCARM__)
#pragma data_alignment = ENET_BUFF_ALIGNMENT
#endif
__ALIGN_BEGIN enet_rx_bd_struct_t g_rxBuffDescrip[ENET_RXBD_NUM] __ALIGN_END;
#if defined(__ICCARM__)
#pragma data_alignment = ENET_BUFF_ALIGNMENT
#endif
__ALIGN_BEGIN enet_tx_bd_struct_t g_txBuffDescrip[ENET_TXBD_NUM] __ALIGN_END;
#if defined(__ICCARM__)
#pragma data_alignment = ENET_BUFF_ALIGNMENT
#endif
__ALIGN_BEGIN uint8_t RxDataBuff[ENET_RXBD_NUM][ENET_RXBUFF_SIZE] __ALIGN_END;
/*******************************************************************************
 * Code
 ******************************************************************************/
/*!
 * @brief Services an ethernet interrupt.
 *
 * @return none.
 */
void ENETIF_Callback(ENET_Type *base, enet_handle_t *handle, enet_event_t event, uint8_t channel, void *param)
{
    switch (event)
    {
        case kENET_RxIntEvent:
            ENETIF_Input(handle, channel, param);
            break;
        case kENET_TxIntEvent:
            VNIC_EnetTxDone();
            break;
        default:
            break;
    }
}

/*!
 * @brief Get the ethernet speed.
 *
 * @return Value of ethernet speed in Mbps.
 */
uint32_t ENETIF_GetSpeed(void)
{
    uint32_t phyAddr = 0;
    bool link = false;
    phy_speed_t speed;
    phy_duplex_t duplex;
    uint32_t count = 0;
    speed = kPHY_Speed100M;
    while ((count < ENET_PHY_TIMEOUT) && (!link))
    {
        PHY_GetLinkStatus(ENET, phyAddr, &link);
        if (link)
        {
            /* Get the actual PHY link speed. */
            PHY_GetLinkSpeedDuplex(ENET, phyAddr, &speed, &duplex);
        }

        count++;
    }

    if (count == ENET_PHY_TIMEOUT)
    {
        usb_echo("\r\nPHY Link down, please check the cable connection.\r\n");
    }
    return (kPHY_Speed100M == speed ? 100 : 10);
}

/*!
 * @brief Get the ethernet link status.
 *
 * @return Ture if linked, otherwise false.
 */
bool ENETIF_GetLinkStatus(void)
{
    uint32_t phyAddr = 0;
    bool link = false;

    uint32_t count = 0;
    while ((count < ENET_PHY_TIMEOUT) && (!link))
    {
        PHY_GetLinkStatus(ENET, phyAddr, &link);

        count++;
    }

    if (count == ENET_PHY_TIMEOUT)
    {
        usb_echo("\r\nPHY Link down, please check the cable connection.\r\n");
    }
    return link;
}

/*!
 * @brief Transmit the packet.
 *
 * @return Error code.
 */

enet_err_t ENETIF_Output(pbuf_t *packetBuffer)
{
    status_t sts;
    enet_err_t err;
    if (packetBuffer->length >= ENET_FRAME_MAX_FRAMELEN)
    {
        return ENET_ERROR;
    }
    /* Send a frame out. */
    sts = ENET_SendFrame(ENET, &g_handle, packetBuffer->payload, packetBuffer->length);
    if (kStatus_Success == sts)
    {
        err = ENET_OK;
    }
    else if (kStatus_ENET_TxFrameBusy == sts)
    {
        err = ENET_BUSY;
    }
    else
    {
        err = ENET_ERROR;
    }
    return err;
}

/*!
 * @brief Handle the receptions of packets from the network interface.
 *
 * @return none.
 */
void ENETIF_Input(enet_handle_t *handle, uint8_t channel, void *param)
{
    enet_header_t *ethhdr;
    status_t status;
    pbuf_t packetBuffer;
    uint32_t length = 0;

    /* Read all data from ring buffer and send to uper layer */
    do
    {
        length = 0;
        /* Get the Frame size */
        status = ENET_GetRxFrameSize(ENET, handle, &length, channel);
        /* Call ENET_ReadFrame when there is a received frame. */
        if (status == kStatus_Success)
        {
            packetBuffer.payload = VNIC_EnetRxBufAlloc();
            /* Received valid frame. Deliver the rx buffer with the size equal to length. */
            if (packetBuffer.payload != NULL)
            {
                packetBuffer.length = (uint16_t)length;
                ENET_ReadFrame(ENET, handle, packetBuffer.payload, packetBuffer.length, channel);

                /* points to packet payload, which starts with an Ethernet header */
                ethhdr = (enet_header_t *)packetBuffer.payload;

                switch (USB_SHORT_FROM_BIG_ENDIAN(ethhdr->type))
                {
                    /* IP or ARP packet? */
                    case ETHTYPE_IP:
                    case ETHTYPE_ARP:
                        /* send packet to application to process */
                        VNIC_EnetCallback(&packetBuffer);
                        break;

                    default:
                        VNIC_EnetRxBufFree(&packetBuffer);
                        break;
                }
            }
            else
            {
                /* No packet buffer available, ignore this packet. */
                ENET_ReadFrame(ENET, handle, NULL, length, channel);
            }
        }
        else if (status == kStatus_ENET_RxFrameError)
        {
            /* update the receive buffer. */
            ENET_ReadFrame(ENET, handle, NULL, 0, channel);
        }
    } while (kStatus_ENET_RxFrameEmpty != status);
}

/*!
 * @brief Initialize the ethernet.
 *
 * @return Error code.
 */
enet_err_t ENETIF_Init(void)
{
    enet_config_t config;
    uint32_t rxbuffer[ENET_RXBD_NUM];
    uint8_t index;
    uint32_t refClock = 50000000; /* 50MHZ for rmii reference clock. */
    phy_speed_t speed;
    phy_duplex_t duplex;
    uint32_t timedelay;
    uint32_t phyAddr = 0;
    enet_err_t result = ENET_OK;
    bool link = false;

     /* initialize the hardware */
    /* set MAC hardware address */
    g_hwaddr[0] = configMAC_ADDR0;
    g_hwaddr[1] = configMAC_ADDR1;
    g_hwaddr[2] = configMAC_ADDR2;
    g_hwaddr[3] = configMAC_ADDR3;
    g_hwaddr[4] = configMAC_ADDR4;
    g_hwaddr[5] = configMAC_ADDR5;
    
    for (index = 0; index < ENET_RXBD_NUM; index++)
    {
        rxbuffer[index] = (uint32_t)(&RxDataBuff[index][0]);
    }

    /* prepare the buffer configuration. */
    enet_buffer_config_t buffConfig = {
        ENET_RXBD_NUM,       ENET_TXBD_NUM,
        &g_txBuffDescrip[0], &g_txBuffDescrip[0],
        &g_rxBuffDescrip[0], &g_rxBuffDescrip[ENET_RXBD_NUM],
        &rxbuffer[0],        ENET_BuffSizeAlign(ENET_RXBUFF_SIZE),
    };
    return result;
    PHY_Init(ENET, phyAddr, 0);

    /* Get default configuration 100M RMII. */
    ENET_GetDefaultConfig(&config);

    /* Get the actual PHY link speed. */
    PHY_GetLinkSpeedDuplex(ENET, phyAddr, &speed, &duplex);
    /* Change the MII speed and duplex for actual link status. */
    config.miiSpeed = (enet_mii_speed_t)speed;
    config.miiDuplex = (enet_mii_duplex_t)duplex;

    /* Initialize ENET. */
    config.specialControl = kENET_StoreAndForward;
    ENET_Init(ENET, &config, &g_hwaddr[0], refClock);

    NVIC_SetPriority(ETHERNET_IRQn, 3U);
    ENET_EnableInterrupts(ENET, kENET_DmaTx);
    ENET_EnableInterrupts(ENET, kENET_DmaRx);
    /* Initialize Descriptor. */
    ENET_DescriptorInit(ENET, &config, &buffConfig);

    /* Create the handler. */
    ENET_CreateHandler(ENET, &g_handle, &config, &buffConfig, ENETIF_Callback, NULL);
    /* Active TX/RX. */
    ENET_StartRxTx(ENET, 1, 1);

    PHY_GetLinkStatus(ENET, phyAddr, &link);
    /* Wait for link up. */
    while (!link)
    {
        usb_echo("\r\nLink down, please check the cable connection and test will start when link up\r\n");

        for (timedelay = 0; timedelay < 0xFFFU; timedelay++)
        {
        }
        PHY_GetLinkStatus(ENET, phyAddr, &link);
    }

    return result;
}
