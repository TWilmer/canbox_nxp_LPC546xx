################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../source/semihost_hardfault.c \
../source/usb_device_descriptor.c \
../source/virtual_com.c 

OBJS += \
./source/semihost_hardfault.o \
./source/usb_device_descriptor.o \
./source/virtual_com.o 

C_DEPS += \
./source/semihost_hardfault.d \
./source/usb_device_descriptor.d \
./source/virtual_com.d 


# Each subdirectory must supply rules for building sources it contributes
source/%.o: ../source/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU C Compiler'
	arm-none-eabi-gcc -D__REDLIB__ -DCPU_LPC54616J512BD100 -DCPU_LPC54616J512BD100_cm4 -DFSL_RTOS_BM -DSDK_OS_BAREMETAL -DSDK_DEBUGCONSOLE=0 -DCR_INTEGER_PRINTF -DPRINTF_FLOAT_ENABLE=0 -D__MCUXPRESSO -D__USE_CMSIS -DDEBUG -I../drivers -I../CMSIS -I../device -I../board -I../source -I../ -I"/storage/home/thorsten/workspace/canbox_nxp_LPC546xx/LPC54616J512_Project/usb/include" -I../osa -I../usb/device/source/lpcip3511 -I../usb/device/include -I../usb/device/class -I../usb/device/class/cdc -I../usb/device/source/ -O0 -fno-common -g3 -Wall -c -ffunction-sections -fdata-sections -ffreestanding -fno-builtin -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -D__REDLIB__ -fstack-usage -specs=redlib.specs -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.o)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


