################################################################################
# Automatically-generated file. Do not edit!
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include src/userio/subdir.mk
-include src/timers/subdir.mk
-include src/printers/subdir.mk
-include src/platform/subdir.mk
-include src/iic/subdir.mk
-include src/fixFFT/subdir.mk
-include src/dma/subdir.mk
-include src/audio/subdir.mk
-include src/subdir.mk
-include subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

# Add inputs and outputs from these tool invocations to the build variables 
ELFSIZE += \
Zybo-Z7-10-DMA.elf.size \


# All Target
all: pre-build main-build

# Main-build Target
main-build: Zybo-Z7-10-DMA.elf secondary-outputs

# Tool invocations
Zybo-Z7-10-DMA.elf: $(OBJS) ../src/lscript.ld $(USER_OBJS)
	@echo 'Building target: $@'
	@echo 'Invoking: ARM v7 gcc linker'
	arm-none-eabi-gcc -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -Wl,-build-id=none -specs=Xilinx.spec -Wl,-T -Wl,../src/lscript.ld -L../../Zybo-Z7-10-DMA_bsp/ps7_cortexa9_0/lib -o "Zybo-Z7-10-DMA.elf" $(OBJS) $(USER_OBJS) $(LIBS)
	@echo 'Finished building target: $@'
	@echo ' '

Zybo-Z7-10-DMA.elf.size: Zybo-Z7-10-DMA.elf
	@echo 'Invoking: ARM v7 Print Size'
	arm-none-eabi-size Zybo-Z7-10-DMA.elf  |tee "Zybo-Z7-10-DMA.elf.size"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) $(EXECUTABLES)$(OBJS)$(S_UPPER_DEPS)$(C_DEPS)$(ELFSIZE) Zybo-Z7-10-DMA.elf
	-@echo ' '

pre-build:
	-a9-linaro-pre-build-step
	-@echo ' '

secondary-outputs: $(ELFSIZE)

.PHONY: all clean dependents
.SECONDARY: main-build pre-build

-include ../makefile.targets
