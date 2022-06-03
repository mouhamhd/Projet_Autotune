#ifndef FIX_FFT_H
#define FIX_FFT_H
#include <stdio.h>

#define N_WAVE      1024    /* full length of Sinewave[] */
#define LOG2_N_WAVE 10      /* log2(N_WAVE) */


int fix_fftr(int16_t*, int, int);
int fix_fft(int16_t fr[], int16_t fi[], int16_t m, int16_t inverse);
int16_t FIX_MPY(int16_t a, int16_t b);


#endif
