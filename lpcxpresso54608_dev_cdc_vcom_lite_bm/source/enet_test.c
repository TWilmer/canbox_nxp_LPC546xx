/*
 * enet_test.c
 *
 *  Created on: Sep 20, 2019
 *      Author: root
 */
#include <stdio.h>
#include "fsl_enet.h"
#include "fsl_phy.h"
#include "pin_mux.h"
#include "board.h"


#define EXAMPLE_PHY_ADDR (0x01U)
#define EXAMPLE_ENET_BASE ENET

uint8_t g_macAddr[6]     = {0xd4, 0xbe, 0xd9, 0x45, 0x22, 0x60};
uint8_t multicastAddr[6] = {0x01, 0x00, 0x5e, 0x00, 0x01, 0x81};
uint8_t g_txCosumIdx = 0;

enet_handle_t g_handle = {0};
#define ENET_EXAMPLE_SEND_COUNT (20U)
#define ENET_EXAMPLE_FRAME_HEADSIZE (14U)
#define ENET_EXAMPLE_DATA_LENGTH (60U)
#define ENET_EXAMPLE_FRAME_SIZE (ENET_EXAMPLE_DATA_LENGTH + ENET_EXAMPLE_FRAME_HEADSIZE)
#define ENET_EXAMPLE_PACKAGETYPE (4U)
#define ENET_RXBD_NUM (4)
#define ENET_TXBD_NUM (4)
#define ENET_RXBUFF_SIZE (ENET_FRAME_MAX_FRAMELEN)

void phy_setXMMI_Loopback(bool value)
{
	 uint32_t BMCR=0;
	 uint32_t BISTCTR=0;
	 uint32_t BISTCR=0;
	PHY_Read(ENET, ENET_PHY_ADDR, PHY_BASICCONTROL_REG, &BMCR);
	printf("Initial BMCR is %x\n",BMCR );
	if(false)
		BMCR |= (1<<14);
	else
		BMCR &=~(1<<14);
// 110 0001 0000 0000

	PHY_Write(ENET, ENET_PHY_ADDR, PHY_BASICCONTROL_REG,BMCR );
	printf("Write BMCR is %x\n",BMCR );
	PHY_Read(ENET, ENET_PHY_ADDR, PHY_BASICCONTROL_REG, &BMCR);
	printf("Got BMCR is %x\n",BMCR );

	PHY_Read(ENET, ENET_PHY_ADDR, PHY_BISTCR_REG, &BISTCTR);
	printf("Initial BISTCTR is %x\n",BISTCTR );
		if(value)
			BISTCTR |= (1<<6);
		else
			BISTCTR &=~(1<<6);

	PHY_Write(ENET, ENET_PHY_ADDR, PHY_BISTCR_REG,BISTCTR);
	printf("Write BISTCTR is %x\n",BISTCTR );
	PHY_Read(ENET, ENET_PHY_ADDR, PHY_BISTCR_REG, &BISTCTR);
    printf("Got BISTCTR is %x\n",BISTCTR );



	PHY_Read(ENET, ENET_PHY_ADDR, PHY_BASICCONTROL_REG, &BISTCR);
	printf("Initial BISTCR is %x\n",BISTCR );
	if(value)
		BISTCR |= (1<<2);
	else
		BISTCR &=~(1<<2);
// 110 0001 0000 0000

	PHY_Write(ENET, ENET_PHY_ADDR, PHY_BISTCR_REG,BISTCR );
	printf("Write BISTCR is %x\n",BISTCR );
	PHY_Read(ENET, ENET_PHY_ADDR, PHY_BISTCR_REG, &BISTCR);
	printf("Got BISTCR is %x\n",BISTCR );

	uint32_t xMII_IMP_CTRL;
	PHY_Read(ENET, ENET_PHY_ADDR, PHY_xMII_IMP_CTRL_REG, &xMII_IMP_CTRL);
	printf("Read xMII_IMP_CTRL is %x\n",xMII_IMP_CTRL );
//	PHY_Write(ENET, ENET_PHY_ADDR, PHY_xMII_IMP_CTRL_REG, 0x0400 | (0x1F<<1));
	PHY_Write(ENET, ENET_PHY_ADDR, PHY_xMII_IMP_CTRL_REG, 0x0400 );

	 uint32_t MON_STAT2=0;
	PHY_Read(ENET, ENET_PHY_ADDR, PHY_MON_STAT2_REG, &MON_STAT2);
	printf("Got MON_STAT2 is %x\n",MON_STAT2 );

	 uint32_t MON_STAT1=0;
		PHY_Read(ENET, ENET_PHY_ADDR, PHY_MON_STAT1_REG, &MON_STAT1);
		printf("Got MON_STAT1 is %x\n",MON_STAT1 );


}
#define ENET_ALIGN(x, align) ((unsigned int)((x) + ((align)-1)) & (unsigned int)(~(unsigned int)((align)-1)))
#define ENET_BuffSizeAlign(n) ENET_ALIGN(n, ENET_BUFF_ALIGNMENT)

#ifndef __ALIGN_END
#define __ALIGN_END __attribute__((aligned(ENET_BUFF_ALIGNMENT)))
#endif
#ifndef __ALIGN_BEGIN
#define __ALIGN_BEGIN
#endif
__ALIGN_BEGIN enet_rx_bd_struct_t g_rxBuffDescrip[ENET_RXBD_NUM] __ALIGN_END ;
__ALIGN_BEGIN enet_tx_bd_struct_t g_txBuffDescrip[ENET_TXBD_NUM]  __ALIGN_END ;
uint8_t *g_txbuff[ENET_TXBD_NUM];
/*******************************************************************************
 * Code
 ******************************************************************************/

volatile bool txBufferFree;
void ENET_IntCallback(ENET_Type *base, enet_handle_t *handle, enet_event_t event, uint8_t channel, void *param)
{
    switch (event)
    {
        case kENET_TxIntEvent:
            /* Free tx buffers. */

            txBufferFree=true;
            break;
        default:
            break;
    }
}

uint32_t g_txIdx     = 0;
uint8_t g_txbuffIdx  = 0;
uint32_t g_testIdx   = 0;
uint8_t g_frame[ENET_EXAMPLE_PACKAGETYPE][ENET_EXAMPLE_FRAME_SIZE];
#define ENET_EXAMPLE_PACKAGETYPE (4U)
/*! @brief Build Frame for transmit. */
static void ENET_BuildBroadCastFrame(void)
{
    uint32_t count = 0;
    uint32_t index = 0;

    /* Create different transmit frames. */
    for (index = 0; index < ENET_EXAMPLE_PACKAGETYPE; index++)
    {
        for (count = 0; count < 6U; count++)
        {
            g_frame[index][count] = 0xFFU;
        }
        memcpy(&g_frame[0][6], &g_macAddr[0], 6U);
        memcpy(&g_frame[index][6], &g_macAddr[0], 6U);

        g_frame[index][12] = (ENET_EXAMPLE_DATA_LENGTH >> 8) & 0xFFU;
        g_frame[index][13] = ENET_EXAMPLE_DATA_LENGTH & 0xFFU;

        for (count = ENET_EXAMPLE_FRAME_HEADSIZE; count < ENET_EXAMPLE_FRAME_SIZE; count++)
        {
            g_frame[index][count] = (count + index) % 0xFFU;
        }
    }
}
uint8_t  TXBuffer[ENET_EXAMPLE_FRAME_SIZE];

uint8_t rxbufferData[ENET_RXBD_NUM][ENET_RXBUFF_SIZE];


int enet_test(void)
{
    enet_config_t config;
    uint32_t rxbuffer[ENET_RXBD_NUM];
    uint8_t index;
    void *buff;
    uint32_t refClock = 50000000; /* 50MHZ for rmii reference clock. */
    phy_speed_t speed;
    phy_duplex_t duplex;
    uint32_t length = 0;
    uint32_t count  = 0;

    status_t status;
    bool link = false;

    uint32_t idReg=0;



    for (index = 0; index < ENET_RXBD_NUM; index++)
    {
        /* This is for rx buffers, static alloc and dynamic alloc both ok. use as your wish. */
        buff =&rxbufferData[index][0];
        if (buff)
        {
            rxbuffer[index] = (uint32_t)buff;
        }
        else
        {
            printf("Mem Alloc fail\r\n");
        }
    }

    /* prepare the buffer configuration. */
    enet_buffer_config_t buffConfig = {
        ENET_RXBD_NUM,       ENET_TXBD_NUM,
        &g_txBuffDescrip[0], &g_txBuffDescrip[0],
        &g_rxBuffDescrip[0], &g_rxBuffDescrip[ENET_RXBD_NUM],
        &rxbuffer[0],        ENET_BuffSizeAlign(ENET_RXBUFF_SIZE),
    };

    /* Hardware Initialization. */
    CLOCK_EnableClock(kCLOCK_InputMux);
    /* attach 12 MHz clock to FLEXCOMM0 (debug console) */
    CLOCK_AttachClk(BOARD_DEBUG_UART_CLK_ATTACH);

    BOARD_InitPins();
    BOARD_BootClockRUN();
    BOARD_InitDebugConsole();
	  CLOCK_EnableClock(kCLOCK_Eth);
	  CLOCK_EnableClock(kCLOCK_Dma);
	    CLOCK_EnableClock(kCLOCK_Gpio0);
	    CLOCK_EnableClock(kCLOCK_Gpio1);
	    CLOCK_EnableClock(kCLOCK_Gpio2);
	    CLOCK_EnableClock(kCLOCK_Gpio3);


printf("Test2");
    printf("\r\nENET example start.\r\n");
    RELAY_INIT(1);
  	  LED1_INIT(1);
  	  RELAY_INIT(0);
  	  PHY_EN_SET(1);
  	  PHY_WAKE_SET(1);

  	  board_sleep(1000);
  	  PHY_RESET_SET(0);
  	  LED1_INIT(0);
  	  board_sleep(1000);

  	PHY_RESET_SET(1);
  	LED1_INIT(1);
	  board_sleep(500);
  	   ENET_SetSMI(ENET);
  		      PHY_Init(EXAMPLE_ENET_BASE, EXAMPLE_PHY_ADDR, 0);


    /* Get default configuration 100M RMII. */
    ENET_GetDefaultConfig(&config);

    /* Use the actual speed and duplex when phy success to finish the autonegotiation. */
    config.miiSpeed  = kENET_MiiSpeed100M;
    config.miiDuplex = kENET_MiiFullDuplex;
    config.miiMode = kENET_RmiiMode;

    /* Initialize ENET. */
    ENET_Init(EXAMPLE_ENET_BASE, &config, &g_macAddr[0], refClock);

    /* Initialize Descriptor. */
    ENET_DescriptorInit(EXAMPLE_ENET_BASE, &config, &buffConfig);

    /* Create the handler. */
    ENET_CreateHandler(EXAMPLE_ENET_BASE, &g_handle, &config, &buffConfig, ENET_IntCallback, NULL);
    /* Active TX/RX. */
    ENET_StartRxTx(EXAMPLE_ENET_BASE, 1, 1);

    /* Build broadcast for sending and active for receiving. */
    ENET_BuildBroadCastFrame();




			PHY_Read(ENET, ENET_PHY_ADDR, PHY_ID1_REG, &idReg);
			printf("Phy %d ID: %x\n",ENET_PHY_ADDR, idReg);
			if(idReg!=0x2000)
			{
				printf("Unexpected phy found or wrong address used\n");
			}
			PHY_Read(ENET, ENET_PHY_ADDR, PHY_ID2_REG, &idReg);
					printf("Phy %d ID2: %x\n",ENET_PHY_ADDR, idReg);
					if(idReg!=0xa253)
					{
						printf("Unexpected phy found or wrong address used\n");
					}

					phy_setXMMI_Loopback(1);

				    board_sleep(1000);


//GPIO_TEST(1);
if(true)
								{
    printf("\r\nTransmission start now!\r\n");


    ENET->MAC_FRAME_FILTER|=ENET_MAC_FRAME_FILTER_PCF(2);
    ENET->MAC_FRAME_FILTER|=ENET_MAC_FRAME_FILTER_PR(1);
    ENET->MAC_FRAME_FILTER|=ENET_MAC_FRAME_FILTER_PM(1);
    ENET->MAC_FRAME_FILTER|=ENET_MAC_FRAME_FILTER_RA(1);


    ENET->MAC_CONFIG|=ENET_MAC_CONFIG_DO(0);
    ENET->MAC_CONFIG|=ENET_MAC_CONFIG_DCRS(1);

    ENET->MAC_EXT_CONFIG|=ENET_MAC_EXT_CONFIG_DCRCC(1);
}
   //  ENET->MAC_CONFIG|=ENET_MAC_CONFIG_LM(1);
    while (1)
    {
        /* Get the Frame size */
        status = ENET_GetRxFrameSize(EXAMPLE_ENET_BASE, &g_handle, &length, 0);
        /* Call ENET_ReadFrame when there is a received frame. */
        if ((status == kStatus_Success) && (length != 0))
        {
            /* Received valid frame. Deliver the rx buffer with the size equal to length. */
            uint8_t data[2048];

                status = ENET_ReadFrame(EXAMPLE_ENET_BASE, &g_handle, data, length, 0);
                if (status == kStatus_Success)
                {
                    printf(" One frame received. the length %d \r\n", length);
                    printf(" Dest Address %02x:%02x:%02x:%02x:%02x:%02x Src Address %02x:%02x:%02x:%02x:%02x:%02x \r\n",
                           data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[8], data[9],
                           data[10], data[11]);
                }




        }
        else if (status == kStatus_ENET_RxFrameError)
        {
            /* update the receive buffer. */
            ENET_ReadFrame(EXAMPLE_ENET_BASE, &g_handle, NULL, 0, 0);
        }

        if (g_testIdx < ENET_EXAMPLE_SEND_COUNT)
        {

                /* Create the frame to be send. */
        		uint8_t buffer[ENET_EXAMPLE_FRAME_SIZE];

                    memcpy(buffer, &g_frame[g_txIdx], ENET_EXAMPLE_FRAME_SIZE);

                    status = ENET_SendFrame(EXAMPLE_ENET_BASE, &g_handle, buffer, ENET_EXAMPLE_FRAME_SIZE);
                    while (status == kStatus_ENET_TxFrameBusy)
                    {
                        status = ENET_SendFrame(EXAMPLE_ENET_BASE, &g_handle, buffer, ENET_EXAMPLE_FRAME_SIZE);
                    }

                    if (kStatus_Success == status)
                    {
                        g_testIdx++;
                        /* Make each transmit different.*/
                        g_txIdx = (g_txIdx + 1) % ENET_EXAMPLE_PACKAGETYPE;
                        /* Store the buffer for mem free.*/
                        g_txbuff[g_txbuffIdx] = buffer;
                        g_txbuffIdx           = (g_txbuffIdx + 1) % ENET_TXBD_NUM;
                        printf("The %d frame transmitted success!\r\n", g_testIdx);
                    }


        }
    }
}
