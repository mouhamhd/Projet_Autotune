################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/iic/iic.c \
../src/iic/intc.c 

OBJS += \
./src/iic/iic.o \
./src/iic/intc.o 

C_DEPS += \
./src/iic/iic.d \
./src/iic/intc.d 


# Each subdirectory must supply rules for building sources it contributes
src/iic/%.o: ../src/iic/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O2 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=neon-vfpv4 -mfloat-abi=hard -I../../Zybo-Z7-10-DMA_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


