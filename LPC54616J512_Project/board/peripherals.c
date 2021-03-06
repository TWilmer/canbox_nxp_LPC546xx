/***********************************************************************************************************************
 * This file was generated by the MCUXpresso Config Tools. Any manual edits made to this file
 * will be overwritten if the respective MCUXpresso Config Tools is used to update this file.
 **********************************************************************************************************************/

/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
!!GlobalInfo
product: Peripherals v6.0
processor: LPC54616J512
package_id: LPC54616J512BD100
mcu_data: ksdk2_0
processor_version: 6.0.2
functionalGroups:
- name: BOARD_InitPeripherals
  called_from_default_init: true
  selectedCore: core0
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/

/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
component:
- type: 'system'
- type_id: 'system_54b53072540eeeb8f8e9343e71f28176'
- global_system_definitions: []
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/

/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
component:
- type: 'msg'
- type_id: 'msg_6e2baaf3b97dbeef01c0043275f9a0e7'
- global_messages: []
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */

/***********************************************************************************************************************
 * Included files
 **********************************************************************************************************************/
#include "peripherals.h"

/***********************************************************************************************************************
 * BOARD_InitPeripherals functional group
 **********************************************************************************************************************/
/***********************************************************************************************************************
 * USART_1 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'USART_1'
- type: 'flexcomm_usart'
- mode: 'polling'
- type_id: 'flexcomm_usart_fcc110cc6b16332e9dfd9e0df675e21f'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'FLEXCOMM0'
- config_sets:
  - usartConfig_t:
    - usartConfig:
      - clockSource: 'FXCOMFunctionClock'
      - clockSourceFreq: 'GetFreq'
      - baudRate_Bps: '115200'
      - parityMode: 'kUSART_ParityDisabled'
      - stopBitCount: 'kUSART_OneStopBit'
      - bitCountPerChar: 'kUSART_8BitsPerChar'
      - loopback: 'false'
      - txWatermark: 'kUSART_TxFifo0'
      - rxWatermark: 'kUSART_RxFifo1'
      - enableRx: 'true'
      - enableTx: 'true'
    - quick_selection: 'QuickSelection1'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const usart_config_t USART_1_config = {
  .baudRate_Bps = 115200,
  .parityMode = kUSART_ParityDisabled,
  .stopBitCount = kUSART_OneStopBit,
  .bitCountPerChar = kUSART_8BitsPerChar,
  .loopback = false,
  .txWatermark = kUSART_TxFifo0,
  .rxWatermark = kUSART_RxFifo1,
  .enableRx = true,
  .enableTx = true
};

void USART_1_init(void) {
  /* Reset FLEXCOMM device */
  RESET_PeripheralReset(kFC0_RST_SHIFT_RSTn);
  USART_Init(USART_1_PERIPHERAL, &USART_1_config, USART_1_CLOCK_SOURCE);
}

/***********************************************************************************************************************
 * GPIO_1 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'GPIO_1'
- type: 'lpc_gpio'
- mode: 'GPIO'
- type_id: 'lpc_gpio_8c9ab9b3668a514c1f4609fe43001865'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'GPIO'
- config_sets:
  - lpc_gpio: []
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */

void GPIO_1_init(void) {
}

/***********************************************************************************************************************
 * ADC_1 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'ADC_1'
- type: 'lpc_adc'
- mode: 'ADC'
- type_id: 'lpc_adc_d4840b616722dd9291a911597277144f'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'ADC0'
- config_sets:
  - fsl_adc:
    - enable_irq: 'false'
    - irq_src: 'kADC_ConvSeqAInterruptEnable'
    - adc_interrupt:
      - IRQn: 'ADC0_SEQA_IRQn'
      - enable_priority: 'false'
      - priority: '0'
      - enable_custom_name: 'false'
    - doSelfCalibration: 'false'
    - enableTempSensor: 'false'
    - adcConfig:
      - clockMode: 'kADC_ClockSynchronousMode'
      - clockSourceFreq: 'BOARD_BootClockRUN'
      - clockDividerNumber: '0'
      - resolution: 'kADC_Resolution8bit'
      - sampleTimeNumber: '0'
      - enableBypassCalibration: 'false'
    - thresholdConfig:
      - thresholdSettingsPair0:
        - ADC_SetThreshold: 'false'
      - thresholdSettingsPair1:
        - ADC_SetThreshold: 'false'
    - adcConvSeqConfigA:
      - enableSeqConfiguration: 'false'
    - adcConvSeqConfigB:
      - enableSeqConfiguration: 'false'
    - channels: []
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const adc_config_t ADC_1configStruct = {
#if defined(FSL_FEATURE_ADC_HAS_CTRL_ASYNMODE) & FSL_FEATURE_ADC_HAS_CTRL_ASYNMODE
  .clockMode = kADC_ClockSynchronousMode,
#endif                           /* FSL_FEATURE_ADC_HAS_CTRL_ASYNMODE. */
  .clockDividerNumber = 0,
#if defined(FSL_FEATURE_ADC_HAS_CTRL_RESOL) & FSL_FEATURE_ADC_HAS_CTRL_RESOL
  .resolution = kADC_Resolution8bit,
#endif                           /* FSL_FEATURE_ADC_HAS_CTRL_RESOL. */
#if defined(FSL_FEATURE_ADC_HAS_CTRL_TSAMP) & FSL_FEATURE_ADC_HAS_CTRL_TSAMP
  .sampleTimeNumber = 0,
#endif                           /* FSL_FEATURE_ADC_HAS_CTRL_TSAMP. */
#if defined(FSL_FEATURE_ADC_HAS_CTRL_BYPASSCAL) & FSL_FEATURE_ADC_HAS_CTRL_BYPASSCAL
  .enableBypassCalibration = false,
#endif                           /* FSL_FEATURE_ADC_HAS_CTRL_BYPASSCAL. */
};

void ADC_1_init(void) {
  /* Initialize ADC0 peripheral */
  ADC_Init(ADC_1_PERIPHERAL, &ADC_1configStruct);
}

/***********************************************************************************************************************
 * SPI_1 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'SPI_1'
- type: 'flexcomm_spi'
- mode: 'SPI_Polling'
- type_id: 'flexcomm_spi_fa73bcfbc0a2fd3b8c6ba5b0b1f1446f'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'FLEXCOMM1'
- config_sets:
  - fsl_spi:
    - spi_mode: 'kSPI_Master'
    - clockSource: 'FXCOMFunctionClock'
    - clockSourceFreq: 'BOARD_BootClockRUN'
    - spi_master_config:
      - enableLoopback: 'false'
      - enableMaster: 'true'
      - polarity: 'kSPI_ClockPolarityActiveHigh'
      - phase: 'kSPI_ClockPhaseFirstEdge'
      - direction: 'kSPI_MsbFirst'
      - baudRate_Bps: '500000'
      - dataWidth: 'kSPI_Data8Bits'
      - sselNum: 'kSPI_Ssel0'
      - sselPol: 'kSPI_SpolActiveAllLow'
      - txWatermark: 'kSPI_TxFifo0'
      - rxWatermark: 'kSPI_RxFifo1'
      - delayConfig:
        - preDelay: '0'
        - postDelay: '0'
        - frameDelay: '0'
        - transferDelay: '0'
    - quick_selection: 'QS_SPI_1'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const spi_master_config_t SPI_1_config = {
  .enableLoopback = false,
  .enableMaster = true,
  .polarity = kSPI_ClockPolarityActiveHigh,
  .phase = kSPI_ClockPhaseFirstEdge,
  .direction = kSPI_MsbFirst,
  .baudRate_Bps = 500000,
  .dataWidth = kSPI_Data8Bits,
  .sselNum = kSPI_Ssel0,
  .sselPol = kSPI_SpolActiveAllLow,
  .txWatermark = kSPI_TxFifo0,
  .rxWatermark = kSPI_RxFifo1,
  .delayConfig = {
    .preDelay = 0,
    .postDelay = 0,
    .frameDelay = 0,
    .transferDelay = 0
  }
};

void SPI_1_init(void) {
  RESET_PeripheralReset( kFC1_RST_SHIFT_RSTn);
  /* Initialization function */
  SPI_MasterInit(SPI_1_PERIPHERAL, &SPI_1_config, SPI_1_CLOCK_SOURCE);
}

/***********************************************************************************************************************
 * SPI_2 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'SPI_2'
- type: 'flexcomm_spi'
- mode: 'SPI_Polling'
- type_id: 'flexcomm_spi_fa73bcfbc0a2fd3b8c6ba5b0b1f1446f'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'FLEXCOMM2'
- config_sets:
  - fsl_spi:
    - spi_mode: 'kSPI_Master'
    - clockSource: 'FXCOMFunctionClock'
    - clockSourceFreq: 'BOARD_BootClockRUN'
    - spi_master_config:
      - enableLoopback: 'false'
      - enableMaster: 'true'
      - polarity: 'kSPI_ClockPolarityActiveHigh'
      - phase: 'kSPI_ClockPhaseFirstEdge'
      - direction: 'kSPI_MsbFirst'
      - baudRate_Bps: '500000'
      - dataWidth: 'kSPI_Data8Bits'
      - sselNum: 'kSPI_Ssel0'
      - sselPol: 'kSPI_SpolActiveAllLow'
      - txWatermark: 'kSPI_TxFifo0'
      - rxWatermark: 'kSPI_RxFifo1'
      - delayConfig:
        - preDelay: '0'
        - postDelay: '0'
        - frameDelay: '0'
        - transferDelay: '0'
    - quick_selection: 'QS_SPI_1'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const spi_master_config_t SPI_2_config = {
  .enableLoopback = false,
  .enableMaster = true,
  .polarity = kSPI_ClockPolarityActiveHigh,
  .phase = kSPI_ClockPhaseFirstEdge,
  .direction = kSPI_MsbFirst,
  .baudRate_Bps = 500000,
  .dataWidth = kSPI_Data8Bits,
  .sselNum = kSPI_Ssel0,
  .sselPol = kSPI_SpolActiveAllLow,
  .txWatermark = kSPI_TxFifo0,
  .rxWatermark = kSPI_RxFifo1,
  .delayConfig = {
    .preDelay = 0,
    .postDelay = 0,
    .frameDelay = 0,
    .transferDelay = 0
  }
};

void SPI_2_init(void) {
  RESET_PeripheralReset( kFC2_RST_SHIFT_RSTn);
  /* Initialization function */
  SPI_MasterInit(SPI_2_PERIPHERAL, &SPI_2_config, SPI_2_CLOCK_SOURCE);
}

/***********************************************************************************************************************
 * SPI_3 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'SPI_3'
- type: 'flexcomm_spi'
- mode: 'SPI_Polling'
- type_id: 'flexcomm_spi_fa73bcfbc0a2fd3b8c6ba5b0b1f1446f'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'FLEXCOMM4'
- config_sets:
  - fsl_spi:
    - spi_mode: 'kSPI_Master'
    - clockSource: 'FXCOMFunctionClock'
    - clockSourceFreq: 'BOARD_BootClockRUN'
    - spi_master_config:
      - enableLoopback: 'false'
      - enableMaster: 'true'
      - polarity: 'kSPI_ClockPolarityActiveHigh'
      - phase: 'kSPI_ClockPhaseFirstEdge'
      - direction: 'kSPI_MsbFirst'
      - baudRate_Bps: '500000'
      - dataWidth: 'kSPI_Data8Bits'
      - sselNum: 'kSPI_Ssel0'
      - sselPol: 'kSPI_SpolActiveAllLow'
      - txWatermark: 'kSPI_TxFifo0'
      - rxWatermark: 'kSPI_RxFifo1'
      - delayConfig:
        - preDelay: '0'
        - postDelay: '0'
        - frameDelay: '0'
        - transferDelay: '0'
    - quick_selection: 'QS_SPI_1'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const spi_master_config_t SPI_3_config = {
  .enableLoopback = false,
  .enableMaster = true,
  .polarity = kSPI_ClockPolarityActiveHigh,
  .phase = kSPI_ClockPhaseFirstEdge,
  .direction = kSPI_MsbFirst,
  .baudRate_Bps = 500000,
  .dataWidth = kSPI_Data8Bits,
  .sselNum = kSPI_Ssel0,
  .sselPol = kSPI_SpolActiveAllLow,
  .txWatermark = kSPI_TxFifo0,
  .rxWatermark = kSPI_RxFifo1,
  .delayConfig = {
    .preDelay = 0,
    .postDelay = 0,
    .frameDelay = 0,
    .transferDelay = 0
  }
};

void SPI_3_init(void) {
  RESET_PeripheralReset( kFC4_RST_SHIFT_RSTn);
  /* Initialization function */
  SPI_MasterInit(SPI_3_PERIPHERAL, &SPI_3_config, SPI_3_CLOCK_SOURCE);
}

/***********************************************************************************************************************
 * SCTimer_1 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'SCTimer_1'
- type: 'sctimer'
- mode: 'basic'
- type_id: 'sctimer_11116c58643bd290f0e74db0acbc9466'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'SCT0'
- config_sets:
  - main:
    - config:
      - clockMode: 'kSCTIMER_System_ClockMode'
      - clockSource: 'SynchronousFunctionClock'
      - clockSourceFreq: 'GetFreq'
      - SCTInputClockSourceFreq: 'custom:0'
      - clockSelect: 'kSCTIMER_Clock_On_Rise_Input_0'
      - enableCounterUnify: 'true'
      - enableBidirection_l: 'false'
      - enableBidirection_h: 'false'
      - prescale_l: '1'
      - prescale_h: '1'
      - outInitState: ''
    - enableIRQ: 'false'
    - interrupt:
      - IRQn: 'SCT0_IRQn'
      - enable_priority: 'false'
      - priority: '0'
      - enable_custom_name: 'false'
    - enableLTimer: 'true'
    - enableHTimer: 'false'
    - pwms:
      - 0:
        - output: 'kSCTIMER_Out_0'
        - level: 'kSCTIMER_HighTrue'
        - dutyCyclePercent: '50'
    - pwmMode: 'kSCTIMER_EdgeAlignedPwm'
    - pwmFrequency: '1'
    - events: []
    - states:
      - 0:
        - pwms: 'pwm0'
    - quick_selection: 'qs_sctimer_pwm'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const sctimer_config_t SCTimer_1_initConfig = {
  .enableCounterUnify = true,
  .clockMode = kSCTIMER_System_ClockMode,
  .clockSelect = kSCTIMER_Clock_On_Rise_Input_0,
  .enableBidirection_l = false,
  .enableBidirection_h = false,
  .prescale_l = 0,
  .prescale_h = 0,
  .outInitState = (uint8_t)(0)
};
const sctimer_pwm_signal_param_t SCTimer_1_pwmSignalsConfig[1] = {
  {
    .output = kSCTIMER_Out_0,
    .level = kSCTIMER_HighTrue,
    .dutyCyclePercent = 50
  }
};
uint32_t SCTimer_1_pwmEvent[1];

void SCTimer_1_init(void) {
  SCTIMER_Init(SCTIMER_1_PERIPHERAL, &SCTimer_1_initConfig);
  /* Initialization of state 0 */
  SCTIMER_SetupPwm(SCTIMER_1_PERIPHERAL, &SCTimer_1_pwmSignalsConfig[0], kSCTIMER_EdgeAlignedPwm, 1U, SCTIMER_1_CLOCK_FREQ, &SCTimer_1_pwmEvent[0]);
  SCTIMER_StartTimer(SCTIMER_1_PERIPHERAL, kSCTIMER_Counter_L);
}

/***********************************************************************************************************************
 * CAN_1 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'CAN_1'
- type: 'mcan'
- mode: 'interrupts'
- type_id: 'mcan_2d100a4872f8271ba5289791a0db8987'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'CAN1'
- config_sets:
  - interruptsCfg:
    - txBufferInterruptSources:
      - txBufferInterruptSources_L:
        - 0: 'disabled'
        - 1: 'disabled'
        - 2: 'disabled'
        - 3: 'disabled'
        - 4: 'disabled'
        - 5: 'disabled'
        - 6: 'disabled'
        - 7: 'disabled'
        - 8: 'disabled'
        - 9: 'disabled'
        - 10: 'disabled'
        - 11: 'disabled'
        - 12: 'disabled'
        - 13: 'disabled'
        - 14: 'disabled'
        - 15: 'disabled'
      - txBufferInterruptSources_H:
        - 0: 'disabled'
        - 1: 'disabled'
        - 2: 'disabled'
        - 3: 'disabled'
        - 4: 'disabled'
        - 5: 'disabled'
        - 6: 'disabled'
        - 7: 'disabled'
        - 8: 'disabled'
        - 9: 'disabled'
        - 10: 'disabled'
        - 11: 'disabled'
        - 12: 'disabled'
        - 13: 'disabled'
        - 14: 'disabled'
        - 15: 'disabled'
    - interrupts:
      - 0:
        - interrupts: ''
        - enable_irq: 'false'
        - interrupt_line:
          - IRQn: 'CAN1_IRQ0_IRQn'
          - enable_priority: 'false'
          - priority: '0'
          - enable_custom_name: 'false'
      - 1:
        - interrupts: ''
        - enable_irq: 'false'
        - interrupt_line:
          - IRQn: 'CAN1_IRQ1_IRQn'
          - enable_priority: 'false'
          - priority: '0'
          - enable_custom_name: 'false'
    - quick_selection: 'default'
  - fsl_mcan:
    - mcanConfig:
      - clockSource: 'FunctionClock'
      - clockSourceFreq: 'BOARD_BootClockRUN'
      - baudRateA: '500000'
      - baudRateD: '500000'
      - enableCanfdNormal: 'false'
      - enableCanfdSwitch: 'false'
      - loopBackBusMonMode: 'kMCAN_disabled'
      - setNormalOperation: 'true'
      - nominalBitTiming:
        - seg1: '11'
        - seg2: '4'
        - rJumpwidth: '4'
        - bitTime: []
      - dataBitTiming:
        - seg1: '11'
        - seg2: '4'
        - rJumpwidth: '4'
        - bitTime: []
    - messagesConfig:
      - enable_custom_name: 'false'
      - allocateRAM: 'true'
      - stdFilter:
        - listSize: '1'
        - remFrame: 'kMCAN_rejectFrame'
        - nmFrame: 'kMCAN_reject0'
      - extFilter:
        - listSize: '0'
        - remFrame: 'kMCAN_rejectFrame'
        - nmFrame: 'kMCAN_reject0'
      - rxFifo0:
        - elementSize: '1'
        - watermark: '0'
        - opmode: 'kMCAN_FifoBlocking'
        - datafieldSize: 'kMCAN_8ByteDatafield'
      - rxFifo1:
        - elementSize: '0'
        - watermark: '0'
        - opmode: 'kMCAN_FifoBlocking'
        - datafieldSize: 'kMCAN_8ByteDatafield'
      - rxBuffer:
        - elementSize: '0'
        - datafieldSize: 'kMCAN_8ByteDatafield'
      - txFifo:
        - elementSize: '0'
        - watermark: '0'
      - txBuffer:
        - dedicatedSize: '1'
        - fqSize: '0'
        - mode: 'kMCAN_txFifo'
        - datafieldSize: 'kMCAN_8ByteDatafield'
    - stdFilters: []
    - extFilters: []
    - quick_selection: 'default'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const mcan_config_t CAN_1_config = {
  .baudRateA = 500000,
  .baudRateD = 500000,
  .enableCanfdNormal = false,
  .enableCanfdSwitch = false,
  .enableLoopBackInt = false,
  .enableLoopBackExt = false,
  .enableBusMon = false
};
/* Allocation of the Message RAM in memory that is alligned to 16 bits. */
SDK_ALIGN(uint32_t CAN_1_RAM_BASE_ADDRESS[CAN_1_MESSAGE_RAM_SIZE], CAN_1_BASE_ADDRESS_ALIGN_SIZE);
const mcan_timing_config_t CAN_1_nominal_bit_time = {
  .preDivider = 44,
  .seg1 = 10,
  .seg2 = 3,
  .rJumpwidth = 3
};
const mcan_frame_filter_config_t CAN_1_std_filter_config = {
  .address = 0,
  .listSize = 1,
  .idFormat = kMCAN_FrameIDStandard,
  .remFrame = kMCAN_rejectFrame,
  .nmFrame = kMCAN_reject0
};
const mcan_frame_filter_config_t CAN_1_ext_filter_config = {
  .address = 4,
  .listSize = 0,
  .idFormat = kMCAN_FrameIDExtend,
  .remFrame = kMCAN_rejectFrame,
  .nmFrame = kMCAN_reject0
};
const mcan_rx_fifo_config_t CAN_1_rx_fifo0_config = {
  .address = 4,
  .elementSize = 1,
  .watermark = 0,
  .opmode = kMCAN_FifoBlocking,
  .datafieldSize = kMCAN_8ByteDatafield
};
const mcan_rx_fifo_config_t CAN_1_rx_fifo1_config = {
  .address = 20,
  .elementSize = 0,
  .watermark = 0,
  .opmode = kMCAN_FifoBlocking,
  .datafieldSize = kMCAN_8ByteDatafield
};
const mcan_rx_buffer_config_t CAN_1_rx_buffers_config = {
  .address = 20,
  .datafieldSize = kMCAN_8ByteDatafield
};
const mcan_tx_fifo_config_t CAN_1_tx_event_fifo_config = {
  .address = 20,
  .elementSize = 0,
  .watermark = 0
};
const mcan_tx_buffer_config_t CAN_1_tx_buffers_config = {
  .address = 20,
  .dedicatedSize = 1,
  .fqSize = 0,
  .mode = kMCAN_txFifo,
  .datafieldSize = kMCAN_8ByteDatafield
};

void CAN_1_init(void) {
  /* MCAN initialization */
  MCAN_Init(CAN_1_PERIPHERAL, &CAN_1_config, CAN_1_CLOCK_SOURCE);
  /* MCAN nominal (arbitration) timing initialization */
  MCAN_SetArbitrationTimingConfig(CAN_1_PERIPHERAL, &CAN_1_nominal_bit_time);
  /* Message RAM initialization */
  memset(CAN_1_RAM_BASE_ADDRESS, 0,CAN_1_MESSAGE_RAM_SIZE * sizeof(uint32_t));
  MCAN_SetMsgRAMBase(CAN_1_PERIPHERAL, (uint32_t)CAN_1_RAM_BASE_ADDRESS);
  /* Configuration of the standard filter list */
  MCAN_SetFilterConfig(CAN_1_PERIPHERAL, &CAN_1_std_filter_config);
  /* Configuration of the extended filter list */
  MCAN_SetFilterConfig(CAN_1_PERIPHERAL, &CAN_1_ext_filter_config);
  /* Configuration of Rx FIFO 0 */
  MCAN_SetRxFifo0Config(CAN_1_PERIPHERAL, &CAN_1_rx_fifo0_config);
  /* Configuration of Rx FIFO 1 */
  MCAN_SetRxFifo1Config(CAN_1_PERIPHERAL, &CAN_1_rx_fifo1_config);
  /* Configuration of Rx buffers */
  MCAN_SetRxBufferConfig(CAN_1_PERIPHERAL, &CAN_1_rx_buffers_config);
  /* Configuration of Tx event FIFO */
  MCAN_SetTxEventFifoConfig(CAN_1_PERIPHERAL, &CAN_1_tx_event_fifo_config);
  /* Configuration of Tx buffers and FIFO/Queue */
  MCAN_SetTxBufferConfig(CAN_1_PERIPHERAL, &CAN_1_tx_buffers_config);
  /* Setting of the CAN normal mode to start communication */
  MCAN_EnterNormalMode(CAN_1_PERIPHERAL);
}

/***********************************************************************************************************************
 * PINT_1 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'PINT_1'
- type: 'pint'
- mode: 'interrupt_mode'
- type_id: 'pint_cf4a806bb2a6c1ffced58ae2ed7b43af'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'PINT'
- config_sets:
  - general:
    - interrupt_array:
      - 0:
        - interrupt_id: 'INT_0'
        - interrupt_selection: 'PINT.0'
        - interrupt_type: 'kPINT_PinIntEnableNone'
        - callback_function: 'interrupt_int0'
        - enable_callback: 'false'
        - interrupt:
          - IRQn: 'PIN_INT0_IRQn'
          - enable_priority: 'false'
          - priority: '0'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */

void PINT_1_init(void) {
  /* PINT_1 initiation  */
  PINT_Init(PINT);
  /* PINT_1 PINT.0 configuration */
  PINT_PinInterruptConfig(PINT_1_PERIPHERAL, PINT_1_INT_0, kPINT_PinIntEnableNone, interrupt_int0);
}

/***********************************************************************************************************************
 * CAN_2 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'CAN_2'
- type: 'mcan'
- mode: 'interrupts'
- type_id: 'mcan_2d100a4872f8271ba5289791a0db8987'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'CAN0'
- config_sets:
  - interruptsCfg:
    - txBufferInterruptSources:
      - txBufferInterruptSources_L:
        - 0: 'disabled'
        - 1: 'disabled'
        - 2: 'disabled'
        - 3: 'disabled'
        - 4: 'disabled'
        - 5: 'disabled'
        - 6: 'disabled'
        - 7: 'disabled'
        - 8: 'disabled'
        - 9: 'disabled'
        - 10: 'disabled'
        - 11: 'disabled'
        - 12: 'disabled'
        - 13: 'disabled'
        - 14: 'disabled'
        - 15: 'disabled'
      - txBufferInterruptSources_H:
        - 0: 'disabled'
        - 1: 'disabled'
        - 2: 'disabled'
        - 3: 'disabled'
        - 4: 'disabled'
        - 5: 'disabled'
        - 6: 'disabled'
        - 7: 'disabled'
        - 8: 'disabled'
        - 9: 'disabled'
        - 10: 'disabled'
        - 11: 'disabled'
        - 12: 'disabled'
        - 13: 'disabled'
        - 14: 'disabled'
        - 15: 'disabled'
    - interrupts:
      - 0:
        - interrupts: ''
        - enable_irq: 'false'
        - interrupt_line:
          - IRQn: 'CAN0_IRQ0_IRQn'
          - enable_priority: 'false'
          - priority: '0'
          - enable_custom_name: 'false'
      - 1:
        - interrupts: ''
        - enable_irq: 'false'
        - interrupt_line:
          - IRQn: 'CAN0_IRQ1_IRQn'
          - enable_priority: 'false'
          - priority: '0'
          - enable_custom_name: 'false'
    - quick_selection: 'default'
  - fsl_mcan:
    - mcanConfig:
      - clockSource: 'FunctionClock'
      - clockSourceFreq: 'BOARD_BootClockRUN'
      - baudRateA: '500000'
      - baudRateD: '500000'
      - enableCanfdNormal: 'false'
      - enableCanfdSwitch: 'false'
      - loopBackBusMonMode: 'kMCAN_disabled'
      - setNormalOperation: 'true'
      - nominalBitTiming:
        - seg1: '11'
        - seg2: '4'
        - rJumpwidth: '4'
        - bitTime: []
      - dataBitTiming:
        - seg1: '11'
        - seg2: '4'
        - rJumpwidth: '4'
        - bitTime: []
    - messagesConfig:
      - enable_custom_name: 'false'
      - allocateRAM: 'true'
      - stdFilter:
        - listSize: '1'
        - remFrame: 'kMCAN_rejectFrame'
        - nmFrame: 'kMCAN_reject0'
      - extFilter:
        - listSize: '0'
        - remFrame: 'kMCAN_rejectFrame'
        - nmFrame: 'kMCAN_reject0'
      - rxFifo0:
        - elementSize: '1'
        - watermark: '0'
        - opmode: 'kMCAN_FifoBlocking'
        - datafieldSize: 'kMCAN_8ByteDatafield'
      - rxFifo1:
        - elementSize: '0'
        - watermark: '0'
        - opmode: 'kMCAN_FifoBlocking'
        - datafieldSize: 'kMCAN_8ByteDatafield'
      - rxBuffer:
        - elementSize: '0'
        - datafieldSize: 'kMCAN_8ByteDatafield'
      - txFifo:
        - elementSize: '0'
        - watermark: '0'
      - txBuffer:
        - dedicatedSize: '1'
        - fqSize: '0'
        - mode: 'kMCAN_txFifo'
        - datafieldSize: 'kMCAN_8ByteDatafield'
    - stdFilters: []
    - extFilters: []
    - quick_selection: 'default'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const mcan_config_t CAN_2_config = {
  .baudRateA = 500000,
  .baudRateD = 500000,
  .enableCanfdNormal = false,
  .enableCanfdSwitch = false,
  .enableLoopBackInt = false,
  .enableLoopBackExt = false,
  .enableBusMon = false
};
/* Allocation of the Message RAM in memory that is alligned to 16 bits. */
SDK_ALIGN(uint32_t CAN_2_RAM_BASE_ADDRESS[CAN_2_MESSAGE_RAM_SIZE], CAN_2_BASE_ADDRESS_ALIGN_SIZE);
const mcan_timing_config_t CAN_2_nominal_bit_time = {
  .preDivider = 44,
  .seg1 = 10,
  .seg2 = 3,
  .rJumpwidth = 3
};
const mcan_frame_filter_config_t CAN_2_std_filter_config = {
  .address = 0,
  .listSize = 1,
  .idFormat = kMCAN_FrameIDStandard,
  .remFrame = kMCAN_rejectFrame,
  .nmFrame = kMCAN_reject0
};
const mcan_frame_filter_config_t CAN_2_ext_filter_config = {
  .address = 4,
  .listSize = 0,
  .idFormat = kMCAN_FrameIDExtend,
  .remFrame = kMCAN_rejectFrame,
  .nmFrame = kMCAN_reject0
};
const mcan_rx_fifo_config_t CAN_2_rx_fifo0_config = {
  .address = 4,
  .elementSize = 1,
  .watermark = 0,
  .opmode = kMCAN_FifoBlocking,
  .datafieldSize = kMCAN_8ByteDatafield
};
const mcan_rx_fifo_config_t CAN_2_rx_fifo1_config = {
  .address = 20,
  .elementSize = 0,
  .watermark = 0,
  .opmode = kMCAN_FifoBlocking,
  .datafieldSize = kMCAN_8ByteDatafield
};
const mcan_rx_buffer_config_t CAN_2_rx_buffers_config = {
  .address = 20,
  .datafieldSize = kMCAN_8ByteDatafield
};
const mcan_tx_fifo_config_t CAN_2_tx_event_fifo_config = {
  .address = 20,
  .elementSize = 0,
  .watermark = 0
};
const mcan_tx_buffer_config_t CAN_2_tx_buffers_config = {
  .address = 20,
  .dedicatedSize = 1,
  .fqSize = 0,
  .mode = kMCAN_txFifo,
  .datafieldSize = kMCAN_8ByteDatafield
};

void CAN_2_init(void) {
  /* MCAN initialization */
  MCAN_Init(CAN_2_PERIPHERAL, &CAN_2_config, CAN_2_CLOCK_SOURCE);
  /* MCAN nominal (arbitration) timing initialization */
  MCAN_SetArbitrationTimingConfig(CAN_2_PERIPHERAL, &CAN_2_nominal_bit_time);
  /* Message RAM initialization */
  memset(CAN_2_RAM_BASE_ADDRESS, 0,CAN_2_MESSAGE_RAM_SIZE * sizeof(uint32_t));
  MCAN_SetMsgRAMBase(CAN_2_PERIPHERAL, (uint32_t)CAN_2_RAM_BASE_ADDRESS);
  /* Configuration of the standard filter list */
  MCAN_SetFilterConfig(CAN_2_PERIPHERAL, &CAN_2_std_filter_config);
  /* Configuration of the extended filter list */
  MCAN_SetFilterConfig(CAN_2_PERIPHERAL, &CAN_2_ext_filter_config);
  /* Configuration of Rx FIFO 0 */
  MCAN_SetRxFifo0Config(CAN_2_PERIPHERAL, &CAN_2_rx_fifo0_config);
  /* Configuration of Rx FIFO 1 */
  MCAN_SetRxFifo1Config(CAN_2_PERIPHERAL, &CAN_2_rx_fifo1_config);
  /* Configuration of Rx buffers */
  MCAN_SetRxBufferConfig(CAN_2_PERIPHERAL, &CAN_2_rx_buffers_config);
  /* Configuration of Tx event FIFO */
  MCAN_SetTxEventFifoConfig(CAN_2_PERIPHERAL, &CAN_2_tx_event_fifo_config);
  /* Configuration of Tx buffers and FIFO/Queue */
  MCAN_SetTxBufferConfig(CAN_2_PERIPHERAL, &CAN_2_tx_buffers_config);
  /* Setting of the CAN normal mode to start communication */
  MCAN_EnterNormalMode(CAN_2_PERIPHERAL);
}

/***********************************************************************************************************************
 * CTIMER_1 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'CTIMER_1'
- type: 'ctimer'
- mode: 'Capture_Match'
- type_id: 'ctimer_c8b90232d8b6318ba1dac2cf08fb5f4a'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'CTIMER1'
- config_sets:
  - fsl_ctimer:
    - ctimerConfig:
      - mode: 'kCTIMER_TimerMode'
      - clockSource: 'FunctionClock'
      - clockSourceFreq: 'BOARD_BootClockRUN'
      - timerPrescaler: '1'
    - EnableTimerInInit: 'false'
    - matchChannels: []
    - interruptCallbackConfig:
      - interrupt:
        - IRQn: 'CTIMER1_IRQn'
        - enable_priority: 'false'
        - priority: '0'
      - callback: 'kCTIMER_NoCallback'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const ctimer_config_t CTIMER_1_config = {
  .mode = kCTIMER_TimerMode,
  .input = kCTIMER_Capture_0,
  .prescale = 0
};

void CTIMER_1_init(void) {
  /* CTIMER1 peripheral initialization */
  CTIMER_Init(CTIMER_1_PERIPHERAL, &CTIMER_1_config);
}

/***********************************************************************************************************************
 * CTIMER_2 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'CTIMER_2'
- type: 'ctimer'
- mode: 'Capture_Match'
- type_id: 'ctimer_c8b90232d8b6318ba1dac2cf08fb5f4a'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'CTIMER3'
- config_sets:
  - fsl_ctimer:
    - ctimerConfig:
      - mode: 'kCTIMER_TimerMode'
      - clockSource: 'FunctionClock'
      - clockSourceFreq: 'BOARD_BootClockRUN'
      - timerPrescaler: '1'
    - EnableTimerInInit: 'false'
    - matchChannels: []
    - interruptCallbackConfig:
      - interrupt:
        - IRQn: 'CTIMER3_IRQn'
        - enable_priority: 'false'
        - priority: '0'
      - callback: 'kCTIMER_NoCallback'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const ctimer_config_t CTIMER_2_config = {
  .mode = kCTIMER_TimerMode,
  .input = kCTIMER_Capture_0,
  .prescale = 0
};

void CTIMER_2_init(void) {
  /* CTIMER3 peripheral initialization */
  CTIMER_Init(CTIMER_2_PERIPHERAL, &CTIMER_2_config);
}

/***********************************************************************************************************************
 * CTIMER_3 initialization code
 **********************************************************************************************************************/
/* clang-format off */
/* TEXT BELOW IS USED AS SETTING FOR TOOLS *************************************
instance:
- name: 'CTIMER_3'
- type: 'ctimer'
- mode: 'Capture_Match'
- type_id: 'ctimer_c8b90232d8b6318ba1dac2cf08fb5f4a'
- functional_group: 'BOARD_InitPeripherals'
- peripheral: 'CTIMER2'
- config_sets:
  - fsl_ctimer:
    - ctimerConfig:
      - mode: 'kCTIMER_TimerMode'
      - clockSource: 'FunctionClock'
      - clockSourceFreq: 'BOARD_BootClockRUN'
      - timerPrescaler: '1'
    - EnableTimerInInit: 'false'
    - matchChannels: []
    - interruptCallbackConfig:
      - interrupt:
        - IRQn: 'CTIMER2_IRQn'
        - enable_priority: 'false'
        - priority: '0'
      - callback: 'kCTIMER_NoCallback'
 * BE CAREFUL MODIFYING THIS COMMENT - IT IS YAML SETTINGS FOR TOOLS **********/
/* clang-format on */
const ctimer_config_t CTIMER_3_config = {
  .mode = kCTIMER_TimerMode,
  .input = kCTIMER_Capture_0,
  .prescale = 0
};

void CTIMER_3_init(void) {
  /* CTIMER2 peripheral initialization */
  CTIMER_Init(CTIMER_3_PERIPHERAL, &CTIMER_3_config);
}

/***********************************************************************************************************************
 * Initialization functions
 **********************************************************************************************************************/
void BOARD_InitPeripherals(void)
{
  /* Initialize components */
  USART_1_init();
  GPIO_1_init();
  ADC_1_init();
  SPI_1_init();
  SPI_2_init();
  SPI_3_init();
  SCTimer_1_init();
  CAN_1_init();
  PINT_1_init();
  CAN_2_init();
  CTIMER_1_init();
  CTIMER_2_init();
  CTIMER_3_init();
}

/***********************************************************************************************************************
 * BOARD_InitBootPeripherals function
 **********************************************************************************************************************/
void BOARD_InitBootPeripherals(void)
{
  BOARD_InitPeripherals();
}
