################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/kissFFT/kiss_fft.c 

OBJS += \
./src/kissFFT/kiss_fft.o 

C_DEPS += \
./src/kissFFT/kiss_fft.d 


# Each subdirectory must supply rules for building sources it contributes
src/kissFFT/%.o: ../src/kissFFT/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: ARM v7 gcc compiler'
	arm-none-eabi-gcc -Wall -O2 -c -fmessage-length=0 -MT"$@" -mcpu=cortex-a9 -mfpu=vfpv3 -mfloat-abi=hard -I../../Zybo-Z7-10-DMA_bsp/ps7_cortexa9_0/include -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


