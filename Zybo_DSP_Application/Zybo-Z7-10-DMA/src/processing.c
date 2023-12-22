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

int16_t fpsin_temp (int16_t x)
{
   //coefficients' values for the Taylor expansion 
   int16_t  a = 25718;
   int16_t  b = -20953;
   int16_t  c = 18276;


//Intermediate variables declaration

   int16_t x_square;
   int16_t x_cube;
   int16_t x_pow_5;


   int16_t a_x;
   int16_t b_x_cube;
   int16_t c_x_pow_5;


   int16_t add_temp = 0;
   int16_t result = 0;

   //creating x to differents powers
   // x square

   // x => Q(16, 0, 14) and same for all the powers of x since x is betwen -1 and 1
   x_square = mul_int16_int16(x, x);
   x_square = x_square << 1;//Shift to match the right format
   x_cube = mul_int16_int16(x_square, x);
   x_cube = x_cube << 1; //Shift to match the right format
   x_pow_5 = mul_int16_int16(x_cube, x_square);
   x_pow_5 = x_pow_5 << 1; //Shift to match the right format

   //Perform the multiplication with the coefficient

   //x times a, x = Q(16, 0, 15) and a  = Q(16, 1, 14)) a*x = Q(16, 1, 14)
   a_x = mul_int16_int16(x, a);
   a_x = a_x << 1;

   //x_cube times b, x = Q(16, 0, 15) and b  = Q(16, 0, 14)) b*x_cube = Q(16, 0, 14)
   b_x_cube = mul_int16_int16(x_cube, b);
   b_x_cube = b_x_cube << 1;

   //x_pow_5 times c, x = Q(16, 0, 15) and c  = Q(16, -3, 18)) c*x_pow_5 = Q(16, -3, 14)
   c_x_pow_5 = mul_int16_int16(x_pow_5, c);
   c_x_pow_5 = c_x_pow_5 >> 2;


   //Adding
   add_temp = c_x_pow_5 + b_x_cube;
   add_temp = add_temp << 1;

   result = add_temp + a_x;
   result = result << 1;

   return result;

}

int16_t fpsin(int16_t x)
{
   //TODO: Iteration 2: Let's implement a sine in Fixed Point domain !

	int16_t result;

	if (x <= 16384 && x > -16384) //For x between -pi/2 and pi/2
	{
		result = fpsin_temp(x);
	}
	else if ( x > 16384 && x < 32767) //For x between pi/2 and pi
	{
		result = fpsin_temp(32767 - x);
	}
	else
	{
		result = fpsin_temp( -32767 - x ); //For x between -pi and -pi/2
	}

	return result;

}


int16_t sine_wave(int16_t * in, int16_t f, int16_t fs, int16_t size)
{
	//pulsation
	int16_t omega = f/fs;

}
