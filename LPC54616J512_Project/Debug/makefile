################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include usb/device/source/lpcip3511/subdir.mk
-include usb/device/source/subdir.mk
-include usb/device/class/cdc/subdir.mk
-include usb/device/class/subdir.mk
-include startup/subdir.mk
-include source/subdir.mk
-include osa/subdir.mk
-include drivers/subdir.mk
-include device/subdir.mk
-include board/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 

# All Target
all: LPC54616J512_Project.axf

# Tool invocations
LPC54616J512_Project.axf: $(OBJS) $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: MCU Linker'
	arm-none-eabi-gcc -nostdlib -L"/storage/home/thorsten/workspace/canbox_nxp_LPC546xx/LPC54616J512_Project/libs" -Xlinker -Map="LPC54616J512_Project.map" -Xlinker --gc-sections -Xlinker -print-memory-usage -Xlinker --sort-section=alignment -Xlinker --cref -mcpu=cortex-m4 -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -T LPC54616J512_Project_Debug.ld -o "LPC54616J512_Project.axf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '
	$(MAKE) --no-print-directory post-build

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(C_DEPS) LPC54616J512_Project.axf
	-@echo ' '

post-build:
	-@echo 'Performing post-build steps'
	-arm-none-eabi-size "LPC54616J512_Project.axf"; # arm-none-eabi-objcopy -v -O binary "LPC54616J512_Project.axf" "LPC54616J512_Project.bin" ; # checksum -p LPC54616J512 -d "LPC54616J512_Project.bin";
	-@echo ' '

.PHONY: all clean dependents post-build

-include ../makefile.targets
