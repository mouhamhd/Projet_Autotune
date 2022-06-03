// Processing functions
#include "processing.h"
#include "fixFFT/fixFFT.h"
#include <stdint.h>
#include <unistd.h>

void benchmark(int16_t* sig_out,int16_t* sig,int64_t size){
   //TODO Iteration 4: You will use this function, but nothing has to be modified in the function
    int mc_runs = 1;
    struct_timer timer;
    /*--------------------------------------------------------------------------
     * --- Main benchmark call (Monte carlo)
     * --------------------------------------------------------------------------*/
    printf("Starting routine\n");
    timer = tic();
    for (int c = 0 ; c < mc_runs ; c++){
        processing(sig_out,sig,size);
    }
    timer = toc(timer);
    printf("output\n");
    print_toc(timer);
}


int processing(int16_t* sig_out,int16_t* sig, int64_t size)
{
   //TODO Iteration 2: This should fill the function to synthetize sig_out, a new signal (independant from sig)
   //TODO Iteration 3: This should fill the function to synthetize a sig_out, new signal based from sig 
   //TODO Iteration 4: This should update this function to synthetize a signal sig_out, with part of sig
    return 0;
}



/* We use halfword (Int16_t) and with classic product it takes LSB and not MSB 
 * => Ensure double precision multiplier and shift to take MSB 
 */
inline int16_t mul_int16_int16(int16_t x,int16_t y)
{
    return  (int32_t)(x *  y) >> 16;
}

int16_t fpsin(int16_t x)
{
   //TODO: Iteration 2: Let's implement a sine in Fixed Point domain ! 
}
