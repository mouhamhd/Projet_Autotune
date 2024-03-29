/*
 * printers.h
 *
 *  Created on: 11 janv. 2021
 *      Author: robin
 */

#ifndef SRC_PRINTERS_H_
#define SRC_PRINTERS_H_

#include <stdio.h>
#include "xparameters.h"
#include "xil_io.h"
#include "xiic.h"
#include "xil_printf.h"
#include "xil_cache.h"

void print_array_float(float* arr,int size, char* name);
void print_array_u32(u32* arr,int size, char* name);
void print_array_int16_t(int16_t* arr,int size, char* name);
#endif /* SRC_PRINTERS_H_ */
