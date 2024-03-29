/*
 * printers.c
 *
 *  Created on: 11 janv. 2021
 *      Author: robin
 */

#include "printers.h"


/* 
 * Print each element of array of name `name`
 * Dumping in UART is done such that the string can be evaluated by Matlab
 *
*/
void print_array_float(float* arr,int size, char* name){
	printf("%s = [",name);
	for (int i = 0; i < size; i++){
		if (i > 0){
			printf(",");
		}
		printf("%2.4f",arr[i]);
	}
	printf("];\n");
}



void print_array_u32(u32* arr,int size, char* name){
	printf("%s = [",name);
	for (int i = 0; i < size; i++){
		if (i > 0){
			printf(",");
		}
		printf("%lu",arr[i]);
	}
	printf("];\n");
}



void print_array_int16_t(int16_t* arr,int size, char* name){
	printf("%s = [",name);
	for (int i = 0; i < size; i++){
		if (i > 0){
			printf(",");
		}
		printf("%d",arr[i]);
	}
	printf("];\n");
}
