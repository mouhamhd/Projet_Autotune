/*
 * processing.h
 *
 *  Created on: 11 janv. 2021
 *      Author: robin
 */

#ifndef SRC_PROCESSING_H_
#define SRC_PROCESSING_H_

#include <stdio.h>
#include <math.h>
#include "timers/timers.h"
#include "printers/printers.h"
#include "data_file.h"
#include <arm_acle.h> // DSP Intrinsics

/* Mathematical macros */
#define POWER_FFT 10
#define SIZE_FFT (1<<POWER_FFT)   // FIXME Assert SIZE_FFT = 2^POWER_FFT
#define M_PI   3.14159265358979323846


// Core methods 
int processing(int16_t* sig_out,int16_t* sig,int64_t size);
void benchmark(int16_t* sig_out,int16_t* sig,int64_t size);
int16_t fpsin(int16_t x);
int16_t mul_int16_int16(int16_t x,int16_t y);

// Additional user methods 
//TODO Iteration 3, 4: Add all stuff you need

#endif /* SRC_PROCESSING_H_ */
