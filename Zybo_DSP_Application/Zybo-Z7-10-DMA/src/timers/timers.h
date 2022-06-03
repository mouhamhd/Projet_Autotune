/*
 * timers.h
 *
 *  Created on: 8 janv. 2021
 *      Author: robin
 */

#ifndef SRC_TIMERS_H_
#define SRC_TIMERS_H_


#include <stdio.h>  // To print result 
#include <unistd.h> // For cycle to duration [s]
// Define timer structure 
typedef struct{
    unsigned int t_init;
    unsigned int t_final;
    unsigned int overhead;
    float duration;
}struct_timer;

// Low level functions 
unsigned int get_cyclecount (void);
void init_perfcounters (int do_reset, int enable_divider);
float get_cycle_reference(int sleep_duration);
// High level functions (tic/toc)
struct_timer tic();
struct_timer toc(struct_timer timer);
// Print function 
void print_toc(struct_timer timer);



#endif /* SRC_TIMERS_H_ */
