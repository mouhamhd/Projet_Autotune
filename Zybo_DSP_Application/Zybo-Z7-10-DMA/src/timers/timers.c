/*
 * timers.c
 *
 *  Created on: 8 janv. 2021
 *      Author: robin
 */
#include "timers.h"

/*--------------------------------------------------------------------------
* --- Timer API 
* Timer can be called by 
* struct_timer timer = tic();
* myFunction();
* struct_timer timer = toc(timer);
* --------------------------------------------------------------------------*/

// Init the timer structure 
struct_timer tic(){
    // Init timer structure 
    struct_timer timer;
    // Init the counter 
    init_perfcounters(1,1);
    // Measure overhead 
    unsigned int overhead = get_cyclecount();
    overhead = get_cyclecount() - overhead;
    unsigned int t = get_cyclecount();
    // Getting a timestamp to get the final timing duration in seconds 
    // Folding structure 
    timer.t_init = t;
    timer.t_final = 0;
    timer.duration = 0;
    timer.overhead = overhead;
    return timer;
}

// Update the timer structure 
struct_timer toc(struct_timer timer){
    unsigned int t = get_cyclecount();
    struct_timer timer2 = timer;
    // Value without overhead 
    timer2.t_final = t - timer.t_init - timer.overhead; // 667 MHz
    // Convert in second 
   // Sampling 1000 mus to get a timing image 
    int sleep_duration = 1000;
    float scale  = get_cycle_reference(sleep_duration);
     // Getting the scaling value to be applied 
    float duration =  scale * (float) timer2.t_final;
    timer2.duration = duration;
    return timer2;
}

// Plot the number of cycle encountered between a tic() and a toc();
void print_toc(struct_timer timer){
   printf("function took exactly  %2.4f seconds [%d cycles] \r\n ",timer.duration,timer.t_final);
}
    

/*--------------------------------------------------------------------------
* --- Internals  
* --------------------------------------------------------------------------*/
unsigned int get_cyclecount (void)
{
  unsigned int value;
  // Read CCNT Register
  asm volatile ("MRC p15, 0, %0, c9, c13, 0\t\n": "=r"(value));
  return value;
}

// Returns duration (in seconds) per cycle 
float get_cycle_reference(int sleep_duration)
{
    struct_timer temp = tic();
    usleep(sleep_duration);
    unsigned int t2 = get_cyclecount();
    unsigned int effective_duration = t2 - temp.t_init - temp.overhead;
    float scale = ((float) sleep_duration) * 1e-6  / (float) effective_duration;
    return scale;
}

void init_perfcounters (int do_reset, int enable_divider)
{
  // in general enable all counters (including cycle counter)
	int value = 1;

  // peform reset:
  if (do_reset)
  {
    value |= 2;     // reset all counters to zero.
    value |= 4;     // reset cycle counter to zero.
  }

  if (enable_divider)
    value |= 8;     // enable "by 64" divider for CCNT.

  value |= 16;

  // program the performance-counter control-register:
  asm volatile ("MCR p15, 0, %0, c9, c12, 0\t\n" :: "r"(value));

  // enable all counters:
  asm volatile ("MCR p15, 0, %0, c9, c12, 1\t\n" :: "r"(0x8000000f));

  // clear overflows:
  asm volatile ("MCR p15, 0, %0, c9, c12, 3\t\n" :: "r"(0x8000000f));
}





