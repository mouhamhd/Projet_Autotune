/************************************************************************/
/*	 Main function call 
          Minimal code to instantiate all the stuff and do the processing 																	*/
/************************************************************************/
/************************** Run mode  ******************************/
#define RUN_MODE 0
// 0 ==> Offline mode: Processing (autotune) on pre-loaded signal (data_file.c)
// 1 ==> Online mode : Record signal, perform autotune and then render audio
// 2 ==> Benchmark mode : benchmark autotune on pre-loaded signal
/*******************************************************************/

// Main call prototype to hide glue for platform description
#include <stdint.h>
#include "main.h"

/* ---- Platform design header --- */
#include "audio/audio.h"
#include "dma/dma.h"
#include "iic/intc.h"
#include "userio/userio.h"
#include "iic/iic.h"

/* --- Zynq 7010 header files --- */
#include "xaxidma.h"
#include "xparameters.h"
#include "xil_exception.h"
#include "xdebug.h"
#include "xiic.h"
#include "xaxidma.h"
#include "xtime_l.h"

/* --- Sleep system  --- */
#include "xscugic.h"
#include "sleep.h"
#include "xil_cache.h"

/* --- Including user space functions  --- */
#include "printers/printers.h"
#include "timers/timers.h"
#include "data_file.h"
#include "processing.h"

/* --- Other definition  --- */
#if (!defined(DEBUG))
extern void xil_printf(const char *format, ...);
#endif
static XIic sIic;
static XAxiDma sAxiDma; /* Instance of the XAxiDma */
static XGpio sUserIO;
static XScuGic sIntc;
// Interrupt vector table
const ivt_t ivt[] = {
    //IIC
    {XPAR_FABRIC_AXI_IIC_0_IIC2INTC_IRPT_INTR, (Xil_ExceptionHandler)XIic_InterruptHandler, &sIic},
    //DMA Stream to MemoryMap Interrupt handler
    {XPAR_FABRIC_AXI_DMA_0_S2MM_INTROUT_INTR, (Xil_ExceptionHandler)fnS2MMInterruptHandler, &sAxiDma},
    //DMA MemoryMap to Stream Interrupt handler
    {XPAR_FABRIC_AXI_DMA_0_MM2S_INTROUT_INTR, (Xil_ExceptionHandler)fnMM2SInterruptHandler, &sAxiDma},
    //User I/O (buttons, switches, LEDs)
    {XPAR_FABRIC_AXI_GPIO_0_IP2INTC_IRPT_INTR, (Xil_ExceptionHandler)fnUserIOIsr, &sUserIO}};

// DMA reset (call before audio rendering)
void resetDma(){
    // Disable Stream function to send data (S2MM)
    Xil_Out32(I2S_STREAM_CONTROL_REG, 0x00000000);
    Xil_Out32(I2S_TRANSFER_CONTROL_REG, 0x00000000);
    //Reset MM2S event and playback flag
    Demo.fDmaMM2SEvent = 0;
    Demo.fAudioPlayback = 0;
    Xil_DCacheFlushRange((u32)(MEM_BASE_ADDR+ XAXIDMA_BUFFLEN_OFFSET), AUDIO_WORDS); 
}
void populate(u32* ptr0 ,int16_t* sig ,int16_t* size){


	for (int i = 0; i < SIZE; i++)
			{
				ptr0[2*i]   = (u32)(sig[i]);
				ptr0[2*i+1]   = (u32)(sig[i]);
			}
}

int main(void)
{
    //--------------------------------------------------------------------------
    //--- Init all stuff 
    //--------------------------------------------------------------------------
    // Do nothing here !!
    int Status;
    Demo.u8Verbose = 1;
    printf("\n--- Entering main() --- \n");

    //Initialize the interrupt controller
    Status = fnInitInterruptController(&sIntc);
    if (Status != XST_SUCCESS)
    {
        printf("Error initializing interrupts");
        return XST_FAILURE;
    }
    // Initialize IIC controller
    Status = fnInitIic(&sIic);
    if (Status != XST_SUCCESS)
    {
        printf("Error initializing I2C controller");
        return XST_FAILURE;
    }
    // Initialize User I/O driver
    Status = fnInitUserIO(&sUserIO);
    if (Status != XST_SUCCESS)
    {
        printf("User I/O ERROR");
        return XST_FAILURE;
    }
    //Initialize DMA
    Status = fnConfigDma(&sAxiDma);
    if (Status != XST_SUCCESS)
    {
        printf("DMA configuration ERROR");
        return XST_FAILURE;
    }
    //Initialize Audio I2S
    Status = fnInitAudio();
    if (Status != XST_SUCCESS)
    {
        printf("Audio initializing ERROR");
        return XST_FAILURE;
    }
    // Waiting to be sure HW is ready
    {
        XTime tStart, tEnd;
        XTime_GetTime(&tStart);
        do
        {
            XTime_GetTime(&tEnd);
        } while ((tEnd - tStart) / (COUNTS_PER_SECOND / 10) < 20);
    }
    //Initialize Audio I2S
    Status = fnInitAudio();
    if (Status != XST_SUCCESS)
    {
        printf("Audio initializing ERROR");
        return XST_FAILURE;
    }
    // Enable all interrupts in our interrupt vector table
    fnEnableInterrupts(&sIntc, &ivt[0], sizeof(ivt) / sizeof(ivt[0]));

    //--------------------------------------------------------------------------
    //--- Processing
    //--------------------------------------------------------------------------
    printf("----------------------------------------------------------\n");
    printf("Zybo Z7-10 DMA Audio Project\n");
    printf("----------------------------------------------------------\n");
    Demo.fDmaMM2SEvent = 0;
    Demo.fDmaS2MMEvent = 0;


    printf("We work at %d Hz with %d seconds of signal [size %d]\n",AUDIO_SAMPLING_RATE,RECORD_DURATION,AUDIO_SIZE);


    //--------------------------------------------------------------------------
    //--- Position of output
    //--------------------------------------------------------------------------
    /* To alow playback, processed data should be placed at ptr0 
     * /!\ It also corresponds to the position of the RECORDED data !
     */
    //TODO [Iteration 1] Instantiate ptr0 as a u32 pointer here
    u32 *ptr0 = (u32 *)(MEM_BASE_ADDR + XAXIDMA_BUFFLEN_OFFSET);

    if (RUN_MODE== 0)
    {
        //--------------------------------------------------------------------------
        //--- Offline processing
        //--------------------------------------------------------------------------
        /*
           Here you can do the processing you want ! 
           - The signal to be analyzed (offline) is defined in data_file.h data_file.c and is called sig 
           - If you want to play the initial signal you should write it at ptr0
           - The processed signal should be placed at ptr0
           */

        //TODO [Iteration 1] Populate ptr (with sig) to ensure direct  audio rendering
    	//populate(ptr0 , sig ,SIZE);

        //TODO [Iteration 2] Write generate_synth_sig_1() and  generate_synth_sig_2()to generate sig_out
    	 int16_t  sigin[40000];
    	 generate_wave(sigin, 4000, 40000);
    	 populate(ptr0, sigin, 40000);
        //TODO [Iteration 3] Write and fill processing() to generate sig_out
        //TODO [Iteration 4] update  processing() to generate sig_out


        //TODO [Iteration 2][Iteration 3][Iteration4] Populate ptr (with sig_out) to ensure synthetized audio rendering
        
    }
    if (RUN_MODE == 1)
    {
        //--------------------------------------------------------------------------
        //--- Online processing
        //--------------------------------------------------------------------------
        /*
           Real time processing part !
           - It records AUDIO_DURATION (5s)  seconds processing 
           */
        // --- Record
        printf("Records 5 second signals \n");
        fnSetMicInput();
        resetDma();
        fnAudioRecord(sAxiDma, AUDIO_WORDS);
        u8 waitRecord = 1;
        while (waitRecord)
        {
            // Checking the DMA S2MM event flag
            if (Demo.fDmaS2MMEvent)
            {
                printf("\nRecorded done\n");
                // Disable Stream function to send data (S2MM)
                Xil_Out32(I2S_STREAM_CONTROL_REG, 0x00000000);
                Xil_Out32(I2S_TRANSFER_CONTROL_REG, 0x00000000);
                Xil_DCacheInvalidateRange((u32)MEM_BASE_ADDR, AUDIO_WORDS);
                // Reset S2MM event and record flag
                Demo.fDmaS2MMEvent = 0;
                Demo.fAudioRecord = 0;
                waitRecord = 0;
            }
        }
        //TODO [Iteration 4] Apply the processing to generate sig_out
        //TODO [Iteration 4] Populate ptr (with sig_out) to ensure synthetized audio rendering


    } 
    //--------------------------------------------------------------------------
    //--- Payback 
    //--------------------------------------------------------------------------
    // DO NOT TOUCH HERE, THIS IS FOR AUDIO RENDERING
    if (RUN_MODE != 2) {
        // --- Payback
        printf("Play back processed signals \n");
        fnSetHpOutput();
        resetDma();
        fnAudioPlay(sAxiDma, AUDIO_WORDS);
        // Checking the DMA MM2S event flag
        u8 waitPlay = 1;
        while (waitPlay)
        {
            if (Demo.fDmaMM2SEvent)
            {
            resetDma();    
            }
        }
    }
    //--------------------------------------------------------------------------
    //--- Benchmark
    //--------------------------------------------------------------------------
    //TODO [Iteration 4] Launch benchmark to ensure you proceed data in less than 5 seconds (use RUN_MODE)
    // NO NEED TO TOUCH HERE, BENCHMARK IS FUNCTIONNAL
    if (RUN_MODE == 2){
        // Create a  new vector sigOut 
        int16_t* sig_out = malloc(sizeof(int16_t) * SIZE);
        benchmark(sig_out,sig,SIZE);
    }

    //--------------------------------------------------------------------------
    //--- Exit
    //--------------------------------------------------------------------------
    printf("\n--- End of Processing --- \n");
    return XST_SUCCESS;
}
