################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../drivers/fsl_adc.c \
../drivers/fsl_clock.c \
../drivers/fsl_common.c \
../drivers/fsl_ctimer.c \
../drivers/fsl_flashiap.c \
../drivers/fsl_flexcomm.c \
../drivers/fsl_gpio.c \
../drivers/fsl_i2c.c \
../drivers/fsl_i2s.c \
../drivers/fsl_inputmux.c \
../drivers/fsl_mcan.c \
../drivers/fsl_pint.c \
../drivers/fsl_power.c \
../drivers/fsl_reset.c \
../drivers/fsl_sctimer.c \
../drivers/fsl_spi.c \
../drivers/fsl_usart.c 

OBJS += \
./drivers/fsl_adc.o \
./drivers/fsl_clock.o \
./drivers/fsl_common.o \
./drivers/fsl_ctimer.o \
./drivers/fsl_flashiap.o \
./drivers/fsl_flexcomm.o \
./drivers/fsl_gpio.o \
./drivers/fsl_i2c.o \
./drivers/fsl_i2s.o \
./drivers/fsl_inputmux.o \
./drivers/fsl_mcan.o \
./drivers/fsl_pint.o \
./drivers/fsl_power.o \
./drivers/fsl_reset.o \
./drivers/fsl_sctimer.o \
./drivers/fsl_spi.o \
./drivers/fsl_usart.o 

C_DEPS += \
./drivers/fsl_adc.d \
./drivers/fsl_clock.d \
./drivers/fsl_common.d \
./drivers/fsl_ctimer.d \
./drivers/fsl_flashiap.d \
./drivers/fsl_flexcomm.d \
./drivers/fsl_gpio.d \
./drivers/fsl_i2c.d \
./drivers/fsl_i2s.d \
./drivers/fsl_inputmux.d \
./drivers/fsl_mcan.d \
./drivers/fsl_pint.d \
./drivers/fsl_power.d \
./drivers/fsl_reset.d \
./drivers/fsl_sctimer.d \
./drivers/fsl_spi.d \
./drivers/fsl_usart.d 


# Each subdirectory must supply rules for building sources it contributes
drivers/%.o: ../drivers/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_LPC54616J512BD100 -DCPU_LPC54616J512BD100_cm4 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I../drivers -I../CMSIS -I../device -I../board -I../source -I../ -I"/storage/home/thorsten/workspace/canbox_nxp_LPC546xx/LPC54616J512_Project/usb/include" -I../osa -I../usb/device/source/lpcip3511 -I../usb/device/include -I../usb/device/class -I../usb/device/class/cdc -I../usb/device/source/ -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


