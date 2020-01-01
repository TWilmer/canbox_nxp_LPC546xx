/*
 * Copyright (c) 2016, Freescale Semiconductor, Inc.
 * Copyright 2016 - 2017 NXP
 * All rights reserved.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */
#include "fsl_device_registers.h"
#include "clock_config.h"
#include "board.h"
#include "fsl_debug_console.h"

#include <stdio.h>
#include <stdlib.h>

#include "usb_device_config.h"
#include "usb.h"
#include "usb_device.h"

#include "usb_device_class.h"
#include "usb_device_cdc_acm.h"
#include "usb_device_cdc_rndis.h"
#include "usb_device_ch9.h"
#include "usb_device_descriptor.h"
#include "virtual_nic_enetif.h"
#include "virtual_nic.h"
#include "virtual_nic_enet_adapter.h"
#include "composite.h"

#if (defined(FSL_FEATURE_SOC_SYSMPU_COUNT) && (FSL_FEATURE_SOC_SYSMPU_COUNT > 0U))
#include "fsl_sysmpu.h"
#endif /* FSL_FEATURE_SOC_SYSMPU_COUNT */


#include "pin_mux.h"
#include <stdbool.h>
#include "fsl_power.h"


volatile static usb_cdc_vnic_t *g_cdcVnic;

/*******************************************************************************
* Definitions
******************************************************************************/
/* Base unit for ENIT layer is 1Mbps while for RNDIS its 100bps*/
#define ENET_CONVERT_FACTOR (10000)

/*******************************************************************************
 * Prototypes
 ******************************************************************************/
void BOARD_InitHardware(void);
void USB_DeviceClockInit(void);
void USB_DeviceIsrEnable(void);
#if USB_DEVICE_CONFIG_USE_TASK
void USB_DeviceTaskFn(void *deviceHandle);
#endif
void VNIC_EnetRxBufFree(pbuf_t *pbuf);
void VNIC_EnetTxBufFree(pbuf_t *pbuf);
bool VNIC_EnetGetLinkStatus(void);
uint32_t VNIC_EnetGetSpeed(void);
uint8_t *VNIC_EnetTxBufAlloc(void);
usb_status_t VNIC_EnetSend(uint8_t *buf, uint32_t len);
usb_status_t USB_DeviceCdcVnicCallback(class_handle_t handle, uint32_t event, void *param);
usb_status_t USB_DeviceCallback(usb_device_handle handle, uint32_t event, void *param);
usb_status_t VNIC_EnetTxDone(void);
/*******************************************************************************
* Variables
******************************************************************************/
extern usb_device_endpoint_struct_t g_cdcVnicDicEp[];

extern queue_t g_enetRxServiceQueue;
extern queue_t g_enetTxServiceQueue;
extern uint8_t g_hwaddr[ENET_MAC_ADDR_SIZE];
/* Data structure of virtual nic device. */

/* Buffer to receive data. */
#if (defined(USB_DEVICE_CONFIG_EHCI) && (USB_DEVICE_CONFIG_EHCI > 0)) || \
    (defined(USB_DEVICE_CONFIG_LPCIP3511HS) && (USB_DEVICE_CONFIG_LPCIP3511HS > 0))
USB_DMA_NONINIT_DATA_ALIGN(USB_DATA_ALIGN_SIZE) static uint8_t s_currRecvBuf[HS_CDC_VNIC_BULK_OUT_PACKET_SIZE];
#else
USB_DMA_NONINIT_DATA_ALIGN(USB_DATA_ALIGN_SIZE) static uint8_t s_currRecvBuf[FS_CDC_VNIC_BULK_OUT_PACKET_SIZE];
#endif

/* Part 1 of usb transmit buffer. */
#if (defined(USB_DEVICE_CONFIG_EHCI) && (USB_DEVICE_CONFIG_EHCI > 0)) || \
    (defined(USB_DEVICE_CONFIG_LPCIP3511HS) && (USB_DEVICE_CONFIG_LPCIP3511HS > 0))
USB_DMA_NONINIT_DATA_ALIGN(USB_DATA_ALIGN_SIZE) static uint8_t s_usbTxPartOneBuffer[HS_CDC_VNIC_BULK_OUT_PACKET_SIZE];
#else
USB_DMA_NONINIT_DATA_ALIGN(USB_DATA_ALIGN_SIZE) static uint8_t s_usbTxPartOneBuffer[FS_CDC_VNIC_BULK_OUT_PACKET_SIZE];
#endif

/* USB receive buffer to store the rndis packet. size is calculated as
 * ENET_FRAME_MAX_FRAMELEN + sizeof(enet_header_t) + RNDIS_USB_HEADER_SIZE.
 */
USB_DMA_NONINIT_DATA_ALIGN(USB_DATA_ALIGN_SIZE) static uint8_t s_usbRxRndisPacketBuffer[1581];
/* USB receive buffer to store the rndis packet. size is calculated as
 * ENET_FRAME_MAX_FRAMELEN + sizeof(enet_header_t).
 */
USB_DMA_NONINIT_DATA_ALIGN(USB_DATA_ALIGN_SIZE) static uint8_t s_usbTxRndisPacketBuffer[1536];

/* Append byte for zero length packet. */
USB_DMA_INIT_DATA_ALIGN(USB_DATA_ALIGN_SIZE) static uint8_t s_zeroSend = 0x00;



/*******************************************************************************
* Code
******************************************************************************/
#if USB_DEVICE_CONFIG_USE_TASK
void USB_DeviceTaskFn(void *deviceHandle)
{
#if defined(USB_DEVICE_CONFIG_LPCIP3511FS) && (USB_DEVICE_CONFIG_LPCIP3511FS > 0U)
    USB_DeviceLpcIp3511TaskFunction(deviceHandle);
#endif
#if defined(USB_DEVICE_CONFIG_LPCIP3511HS) && (USB_DEVICE_CONFIG_LPCIP3511HS > 0U)
    USB_DeviceLpcIp3511TaskFunction(deviceHandle);
#endif
}
#endif
/*!
 * @brief Set the state of the usb transmit direction
 *
 * @param state The state of the usb transmit direction.
 * @return A USB error code or kStatus_USB_Success.
 */
static inline usb_status_t USB_DeviceVnicTransmitSetState(usb_cdc_vnic_tx_state_t state)
{


    USB_DEVICE_VNIC_CRITICAL_ALLOC();
    USB_DEVICE_VNIC_ENTER_CRITICAL();
    g_cdcVnic->nicTrafficInfo.usbTxState = state;
    USB_DEVICE_VNIC_EXIT_CRITICAL();
    return kStatus_USB_Success;
}

/*!
 * @brief Set the state of the usb receive direction.
 *
 * @param state The state of the usb receive direction.
 * @return A USB error code or kStatus_USB_Success.
 */
static inline usb_status_t USB_DeviceVnicReceiveSetState(usb_cdc_vnic_rx_state_t state)
{
    USB_DEVICE_VNIC_CRITICAL_ALLOC();
    USB_DEVICE_VNIC_ENTER_CRITICAL();
    g_cdcVnic->nicTrafficInfo.usbRxState = state;
    USB_DEVICE_VNIC_EXIT_CRITICAL();
    return kStatus_USB_Success;
}

/*!
 * @brief State process for usb transmit direction.
 *
 * @return A USB error code or kStatus_USB_Success.
 */
usb_status_t USB_DeviceVnicTransmit(void)
{
    usb_status_t error = kStatus_USB_Error;
    vnic_enet_transfer_t cdcAcmTransfer;
    pbuf_t *enetPbuf;
    uint32_t usbTxLen;
    uint32_t usbTxPart_1Len;
    uint8_t *nicData;
    uint32_t length;
    USB_DEVICE_VNIC_CRITICAL_ALLOC();
    uint8_t *firstSendBuff = s_usbTxPartOneBuffer;
    switch (g_cdcVnic->nicTrafficInfo.usbTxState)
    {
        case TX_IDLE:
        {
            /* Initialize the tx variables */
            g_cdcVnic->nicTrafficInfo.usbTxNicData = NULL;
            g_cdcVnic->nicTrafficInfo.usbTxEnetPcb.payload = NULL;
            g_cdcVnic->nicTrafficInfo.usbTxEnetPcb.length = 0;
            g_cdcVnic->nicTrafficInfo.usbTxRndisPkgLength = 0;
            g_cdcVnic->nicTrafficInfo.usbTxPart_1Len = 0;

            /* Get a transfer request from the enet queue */
            error = VNIC_EnetQueueGet(&g_enetRxServiceQueue, &cdcAcmTransfer);
            if (kStatus_USB_Success == error)
            {
                enetPbuf = &(g_cdcVnic->nicTrafficInfo.usbTxEnetPcb);

                enetPbuf->payload = cdcAcmTransfer.buffer;
                enetPbuf->length = cdcAcmTransfer.length;
                length = cdcAcmTransfer.length;
                nicData = cdcAcmTransfer.buffer;

                usbTxLen = length + RNDIS_USB_OVERHEAD_SIZE;
                usbTxPart_1Len = 0;
                g_cdcVnic->nicTrafficInfo.enetRxUsb2hostSent++;
                g_cdcVnic->nicTrafficInfo.usbTxNicData = nicData;
                g_cdcVnic->nicTrafficInfo.usbTxRndisPkgLength = usbTxLen;

                /* RNDIS Protocol defines 1 byte call of 0x00, if transfer size is multiple of endpoint packet size */
                g_cdcVnic->nicTrafficInfo.usbTxZeroSendFlag =
                    (uint8_t)((usbTxLen % g_cdcVnicDicEp[0].maxPacketSize) ? 0 : 1);

                /* Whichever is smaller but not less than RNDIS_USB_OVERHEAD_SIZE */
                usbTxPart_1Len =
                    usbTxLen > g_cdcVnicDicEp[0].maxPacketSize ? g_cdcVnicDicEp[0].maxPacketSize : usbTxLen;

                if (usbTxPart_1Len < RNDIS_USB_OVERHEAD_SIZE)
                {
                    /* For g_cdcVnicDicEp[0].maxPacketSize as 8, 16 or 32 minimum  usbTxPart_1Len has to be
                     either usbTxLen
                     (which is definitely greater than RNDIS_USB_OVERHEAD_SIZE) or at least 64 which is the next allowed
                     multiple of
                     g_cdcVnicDicEp[0].maxPacketSize */
                    usbTxPart_1Len = usbTxLen > 64 ? 64 : usbTxLen;
                }
                g_cdcVnic->nicTrafficInfo.usbTxPart_1Len = usbTxPart_1Len;

                /* Prepare USB Header */
                ((rndis_packet_msg_format_t *)firstSendBuff)->messageType = USB_LONG_TO_LITTLE_ENDIAN(RNDIS_PACKET_MSG);
                ((rndis_packet_msg_format_t *)firstSendBuff)->messageLen = USB_LONG_TO_LITTLE_ENDIAN(usbTxLen);
                ((rndis_packet_msg_format_t *)firstSendBuff)->dataOffset = USB_LONG_TO_LITTLE_ENDIAN(RNDIS_DATA_OFFSET);
                ((rndis_packet_msg_format_t *)firstSendBuff)->dataLen = USB_LONG_TO_LITTLE_ENDIAN(length);
                /* Fill rest of firstSendBuff buffers with payload as much as possible */
                memcpy(firstSendBuff + RNDIS_USB_OVERHEAD_SIZE, nicData, usbTxPart_1Len - RNDIS_USB_OVERHEAD_SIZE);

                USB_DEVICE_VNIC_ENTER_CRITICAL();
                error = USB_DeviceCdcAcmSend(g_cdcVnic->cdcAcmHandle, USB_CDC_VNIC_BULK_IN_ENDPOINT, firstSendBuff,
                                             usbTxPart_1Len);
                if (kStatus_USB_Error != error)
                {
                    USB_DeviceVnicTransmitSetState(TX_PART_ONE_PROCESS);
                }
                else
                {
                    usb_echo("Part One of RNDIS packet send failed, 0x%x\n", error);
                    VNIC_EnetRxBufFree(enetPbuf);
                }
                USB_DEVICE_VNIC_EXIT_CRITICAL();
            }
        }
        break;
        case TX_PART_ONE_PROCESS:
            break;
        case TX_PART_ONE_DONE:
        {
            usbTxLen = g_cdcVnic->nicTrafficInfo.usbTxRndisPkgLength;
            usbTxPart_1Len = g_cdcVnic->nicTrafficInfo.usbTxPart_1Len;
            nicData = g_cdcVnic->nicTrafficInfo.usbTxNicData;
            enetPbuf = &(g_cdcVnic->nicTrafficInfo.usbTxEnetPcb);
            uint8_t returnStatus = kStatus_USB_Success;

            if (usbTxLen > usbTxPart_1Len)
            {
                /* Send the part 2 of the RNDIS packet */
                USB_DEVICE_VNIC_ENTER_CRITICAL();
                memcpy(s_usbTxRndisPacketBuffer, nicData + (usbTxPart_1Len - RNDIS_USB_OVERHEAD_SIZE),
                       usbTxLen - usbTxPart_1Len);
                error = USB_DeviceCdcAcmSend(g_cdcVnic->cdcAcmHandle, USB_CDC_VNIC_BULK_IN_ENDPOINT,
                                             s_usbTxRndisPacketBuffer, usbTxLen - usbTxPart_1Len);

                if (kStatus_USB_Error != error)
                {
                    USB_DeviceVnicTransmitSetState(TX_PART_TWO_PROCESS);
                }
                else
                {
                    usb_echo("Part Two of RNDIS packet send failed, 0x%x\n", returnStatus);
                    VNIC_EnetRxBufFree(enetPbuf);
                }
                USB_DEVICE_VNIC_EXIT_CRITICAL();
            }
            else
            {
                USB_DeviceVnicTransmitSetState(TX_PART_TWO_DONE);
            }
        }
        break;
        case TX_PART_TWO_PROCESS:
            break;
        case TX_PART_TWO_DONE:
        {
            enetPbuf = &(g_cdcVnic->nicTrafficInfo.usbTxEnetPcb);
            if (g_cdcVnic->nicTrafficInfo.usbTxZeroSendFlag == 1)
            {
                /* Send a zero length packet */
                USB_DEVICE_VNIC_ENTER_CRITICAL();
                error = USB_DeviceCdcAcmSend(g_cdcVnic->cdcAcmHandle, USB_CDC_VNIC_BULK_IN_ENDPOINT, &s_zeroSend,
                                             sizeof(uint8_t));
                if (kStatus_USB_Error != error)
                {
                    USB_DeviceVnicTransmitSetState(TX_ZLP_PROCESS);
                }
                else
                {
                    usb_echo("Zero length packet send failed, 0x%x\n", error);
                }
                USB_DEVICE_VNIC_EXIT_CRITICAL();
            }
            else
            {
                VNIC_EnetRxBufFree(enetPbuf);
                g_cdcVnic->nicTrafficInfo.enetRxUsb2host++;
                USB_DeviceVnicTransmitSetState(TX_IDLE);
            }
        }
        break;
        case TX_ZLP_PROCESS:
            break;
        case TX_ZLP_DONE:
        {
            enetPbuf = &(g_cdcVnic->nicTrafficInfo.usbTxEnetPcb);
            VNIC_EnetRxBufFree(enetPbuf);
            g_cdcVnic->nicTrafficInfo.enetRxUsb2host++;
            USB_DeviceVnicTransmitSetState(TX_IDLE);
        }
        break;
        default:
            break;
    }
    return error;
}

/*!
 * @brief State process for usb receive direction.
 *
 * @return A USB error code or kStatus_USB_Success.
 */
usb_status_t USB_DeviceVnicReceive(void)
{
    usb_status_t error = kStatus_USB_Error;
    uint8_t *rndisPktMsgData = NULL;
    uint32_t frameRemainingLen = 0;
    uint32_t messageLen = 0;
    uint8_t *buffer;
    uint32_t len;
    USB_DEVICE_VNIC_CRITICAL_ALLOC();
    switch (g_cdcVnic->nicTrafficInfo.usbRxState)
    {
        case RX_IDLE:
        {
            /* Prime for next receive */
            USB_DEVICE_VNIC_ENTER_CRITICAL();
            error = USB_DeviceCdcAcmRecv(g_cdcVnic->cdcAcmHandle, USB_CDC_VNIC_BULK_OUT_ENDPOINT, s_currRecvBuf,
                                         g_cdcVnicDicEp[1].maxPacketSize);
            if (kStatus_USB_Error != error)
            {
                USB_DeviceVnicReceiveSetState(RX_PART_ONE_PROCESS);
            }
            else
            {
                usb_echo("Part One of RNDIS packet recv failed\r\n");
            }
            USB_DEVICE_VNIC_EXIT_CRITICAL();
        }
        break;
        case RX_PART_ONE_PROCESS:
            break;
        case RX_PART_ONE_DONE:
        {
            buffer = (uint8_t *)g_cdcVnic->nicTrafficInfo.usbRxPartOneBuf;
            len = g_cdcVnic->nicTrafficInfo.usbRxPartOneLen;
            if (0xFFFFFFFFU == len)
            {
                USB_DeviceVnicReceiveSetState(RX_IDLE);
                break;
            }
            messageLen = USB_LONG_TO_LITTLE_ENDIAN(*((uint32_t *)(buffer) + 1));
            ;

            if (!(messageLen % g_cdcVnicDicEp[1].maxPacketSize))
            {
                /* RNDIS Protocol defines 1 byte call of 0x00, if transfer size is multiple of endpoint packet size */
                messageLen++;
            }
            rndisPktMsgData = s_usbRxRndisPacketBuffer;
            memcpy(rndisPktMsgData, buffer, len);

            frameRemainingLen = messageLen - len;

            /* Receive the second part of RNDIS packet from host */
            if (frameRemainingLen)
            {
                /* Required when ethernet packet + usb header is larger than maxPacketSize */
                USB_DEVICE_VNIC_ENTER_CRITICAL();
                error = USB_DeviceCdcAcmRecv(g_cdcVnic->cdcAcmHandle, USB_CDC_VNIC_BULK_OUT_ENDPOINT,
                                             rndisPktMsgData + g_cdcVnicDicEp[1].maxPacketSize, frameRemainingLen);
                if (kStatus_USB_Error != error)
                {
                    USB_DeviceVnicReceiveSetState(RX_PART_TWO_PROCESS);
                }
                else
                {
                    usb_echo("Part Two of RNDIS packet recv failed\r\n");
                }
                USB_DEVICE_VNIC_EXIT_CRITICAL();
            }
            else
            {
                /* Send the ethernet packet */
                USB_DeviceVnicReceiveSetState(RX_USB2ENET_PROCESS);

                error = VNIC_EnetSend((uint8_t *)(rndisPktMsgData + RNDIS_USB_OVERHEAD_SIZE),
                                      messageLen - RNDIS_USB_OVERHEAD_SIZE);

                if (kStatus_USB_Success != error)
                {
                    usb_echo("RX_PART_ONE_DONE, VNIC_EnetSend failed\n");
                }
            }
        }
        break;
        case RX_PART_TWO_PROCESS:
            break;
        case RX_PART_TWO_DONE:
        {
            buffer = (uint8_t *)g_cdcVnic->nicTrafficInfo.usbRxPartTwoBuf;
            len = g_cdcVnic->nicTrafficInfo.usbRxPartTwoLen;
            if (0xFFFFFFFFU == len)
            {
                USB_DeviceVnicReceiveSetState(RX_IDLE);
                break;
            }
            /* Entire ethernet packet with USB header was not received as one transaction */
            rndisPktMsgData = buffer - g_cdcVnicDicEp[1].maxPacketSize;

            /* Re-calculate messageLen as it might have changed because of 1 byte of zero recv */
            messageLen = USB_LONG_TO_LITTLE_ENDIAN(*((uint32_t *)rndisPktMsgData + 1));

            /* Send the ethernet packet */
            USB_DeviceVnicReceiveSetState(RX_USB2ENET_PROCESS);
            error = VNIC_EnetSend((uint8_t *)(rndisPktMsgData + RNDIS_USB_OVERHEAD_SIZE),
                                  messageLen - RNDIS_USB_OVERHEAD_SIZE);

            if (kStatus_USB_Success != error)
            {
                usb_echo("RX_PART_TWO_DONE, VNIC_EnetSend failed\n");
            }
        }
        break;
        case RX_USB2ENET_PROCESS:
#if (defined(USB_DEVICE_CONFIG_EHCI) && (USB_DEVICE_CONFIG_EHCI > 0)) || \
    (defined(USB_DEVICE_CONFIG_KHCI) && (USB_DEVICE_CONFIG_KHCI > 0))
            VNIC_EnetTxDone();
#endif
            USB_DeviceVnicReceiveSetState(RX_USB2ENET_DONE);
            break;
        case RX_USB2ENET_DONE:
        {
            USB_DeviceVnicReceiveSetState(RX_IDLE);
        }
        break;
        default:
            break;
    }
    return error;
}

/*!
 * @brief Callback for RNDIS specific requests.
 *
 * @param handle The class handle of the CDC ACM class.
 * @param event The event for the RNDIS device.
 * @param param The pointer to parameter of the callback.
 * @return A USB error code or kStatus_USB_Success.
 */
usb_status_t USB_DeviceCdcRndisCallback(class_handle_t handle, uint32_t event, void *param)
{
    usb_status_t error = kStatus_USB_Success;
    usb_device_cdc_rndis_request_param_struct_t *rndisParam;
    rndisParam = (usb_device_cdc_rndis_request_param_struct_t *)param;

    switch (event)
    {
        case kUSB_DeviceCdcEventAppGetLinkSpeed:
            if (1 == g_cdcVnic->attach)
            {
                *((uint32_t *)rndisParam->buffer) = VNIC_EnetGetSpeed();
                *((uint32_t *)rndisParam->buffer) *= ENET_CONVERT_FACTOR;
            }
            break;
        case kUSB_DeviceCdcEventAppGetSendPacketSize:
            *((uint32_t *)rndisParam->buffer) = USB_LONG_TO_LITTLE_ENDIAN(g_cdcVnicDicEp[0].maxPacketSize);
            break;
        case kUSB_DeviceCdcEventAppGetRecvPacketSize:
            *((uint32_t *)rndisParam->buffer) = USB_LONG_TO_LITTLE_ENDIAN(g_cdcVnicDicEp[1].maxPacketSize);
            break;
        case kUSB_DeviceCdcEventAppGetMacAddress:
            memcpy(rndisParam->buffer, &g_hwaddr[0], ENET_MAC_ADDR_SIZE);
            break;
        case kUSB_DeviceCdcEventAppGetMaxFrameSize:
            *((uint32_t *)rndisParam->buffer) = (ENET_FRAME_MAX_FRAMELEN + RNDIS_USB_HEADER_SIZE);
            break;
        case kUSB_DeviceCdcEventAppGetLinkStatus:
            if (1 == g_cdcVnic->attach)
            {
                *((uint32_t *)rndisParam->buffer) = VNIC_EnetGetLinkStatus();
            }
            break;
        default:
            break;
    }
    return error;
}

/*!
 * @brief Callback for CDC RNDIS class specific requests.
 *
 * @param handle The class handle of the CDC ACM class.
 * @param event The event for the RNDIS device.
 * @param param The pointer to parameter of the callback.
 * @return A USB error code or kStatus_USB_Success.
 */
usb_status_t USB_DeviceCdcVnicCallback(class_handle_t handle, uint32_t event, void *param)
{
    usb_status_t error = kStatus_USB_Error;
    usb_device_cdc_acm_request_param_struct_t *acmReqParam;
    usb_device_endpoint_callback_message_struct_t *epCbParam;
    acmReqParam = (usb_device_cdc_acm_request_param_struct_t *)param;
    epCbParam = (usb_device_endpoint_callback_message_struct_t *)param;
    switch (event)
    {
        case kUSB_DeviceCdcEventSendResponse:
        {
            if (1 == g_cdcVnic->attach)
            {
                if (NULL == epCbParam->buffer)
                {
                    return error;
                }

                switch (g_cdcVnic->nicTrafficInfo.usbTxState)
                {
                    case TX_PART_ONE_PROCESS:
                        USB_DeviceVnicTransmitSetState(TX_PART_ONE_DONE);
                        break;
                    case TX_PART_TWO_PROCESS:
                        USB_DeviceVnicTransmitSetState(TX_PART_TWO_DONE);
                        break;
                    case TX_ZLP_PROCESS:
                        USB_DeviceVnicTransmitSetState(TX_ZLP_DONE);
                        break;
                    default:
                        break;
                }
            }
        }
        break;
        case kUSB_DeviceCdcEventRecvResponse:
        {
            if (1 == g_cdcVnic->attach)
            {
                switch (g_cdcVnic->nicTrafficInfo.usbRxState)
                {
                    case RX_PART_ONE_PROCESS:
                        g_cdcVnic->nicTrafficInfo.usbRxPartOneBuf = epCbParam->buffer;
                        g_cdcVnic->nicTrafficInfo.usbRxPartOneLen = epCbParam->length;
                        USB_DeviceVnicReceiveSetState(RX_PART_ONE_DONE);
                        break;
                    case RX_PART_TWO_PROCESS:
                        g_cdcVnic->nicTrafficInfo.usbRxPartTwoBuf = epCbParam->buffer;
                        g_cdcVnic->nicTrafficInfo.usbRxPartTwoLen = epCbParam->length;
                        USB_DeviceVnicReceiveSetState(RX_PART_TWO_DONE);
                        break;
                    default:
                        break;
                }
            }
            else
            {
                usb_echo("Discard the received data\r\n");
            }
        }
        break;
        case kUSB_DeviceCdcEventSerialStateNotif:
            ((usb_device_cdc_acm_struct_t *)handle)->hasSentState = 0;
            break;
        case kUSB_DeviceCdcEventSendEncapsulatedCommand:
            if (1 == acmReqParam->isSetup)
            {
                *(acmReqParam->buffer) = (g_cdcVnic->rndisHandle)->rndisCommand;
            }
            else
            {
                USB_DeviceCdcRndisMessageSet(g_cdcVnic->rndisHandle, acmReqParam->buffer, acmReqParam->length);
                *(acmReqParam->length) = 0;
            }
            error = kStatus_USB_Success;
            break;
        case kUSB_DeviceCdcEventGetEncapsulatedResponse:
            USB_DeviceCdcRndisMessageGet(g_cdcVnic->rndisHandle, acmReqParam->buffer, acmReqParam->length);
            error = kStatus_USB_Success;
            break;
        default:
            break;
    }

    return error;
}

usb_status_t USB_DeviceCdcVnicSetConfigure(class_handle_t handle, uint8_t configure)
{
	usb_status_t error = USB_DeviceCdcAcmRecv(handle, USB_CDC_VNIC_BULK_OUT_ENDPOINT, s_currRecvBuf,
            	        	                                             g_cdcVnicDicEp[0].maxPacketSize);
return error;
}

usb_status_t USB_DeviceCdcVnicInit(usb_cdc_vnic_t *item)
{

	g_cdcVnic = item;
	   usb_echo("USB_DeviceCdcVnicInit ...\r\n");
	 /* Initialize the FEC interface */
	    if (ENET_OK != VNIC_EnetInit())
	    {
	        usb_echo("VNIC_EnetInit failed\r\n");
	    }

	 // USB USB_DeviceCdcVnicInit
    USB_DeviceVnicReceiveSetState(RX_PART_ONE_PROCESS);

    g_cdcVnic->speed = USB_SPEED_FULL;
    g_cdcVnic->attach = 0;


	        usb_device_cdc_rndis_config_struct_t rndisConfig;
	        rndisConfig.devMaxTxSize = ENET_FRAME_MAX_FRAMELEN + RNDIS_USB_HEADER_SIZE;
	        rndisConfig.rndisCallback = USB_DeviceCdcRndisCallback;
	        if (kStatus_USB_Success != USB_DeviceCdcRndisInit(g_cdcVnic->cdcAcmHandle, &rndisConfig, &(g_cdcVnic->rndisHandle)))
	        {
	            usb_echo("USB_DeviceCdcRndisInit failed\r\n");
	        }
}

/*!
 * @brief Application task function.
 *
 * This function runs the task for application.
 *
 * @return None.
 */
void USB_DeviceCdcNicTask(void)
{


	if(g_cdcVnic->attach)
	{
	          /* User Code */
	          USB_DeviceVnicTransmit();
	          USB_DeviceVnicReceive();
	}

}




