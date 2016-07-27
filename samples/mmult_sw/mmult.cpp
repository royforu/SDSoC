#include <stdio.h>
#include <stdlib.h>

#include "mmult_accel.h"	/*< Accelerator definition */

#define NUM_TESTS 1024

#include "sds_lib.h"		/*< Basic Time-stamp API */
#define TIME_STAMP_INIT  unsigned long long clock_start, clock_end;  clock_start = sds_clock_counter();  
#define TIME_STAMP_SW  { clock_end = sds_clock_counter(); printf("Average number of processor cycles for golden version: %llu \n", (clock_end-clock_start)/NUM_TESTS); clock_start = sds_clock_counter();  }
#define TIME_STAMP_ACCEL  { clock_end = sds_clock_counter(); printf("Average number of processor cycles for software version: %llu \n", (clock_end-clock_start)/NUM_TESTS); }

/************************** Function Definition ***********************
**/
/**
* Initialize all buffers for mmult 
**/
static void mmult_init(float *tin1Buf,  float *tin2Buf, float *toutBufSw, float *toutBufHw)
{
  int i, j;
  for (i = 0; i < A_NROWS; i++) {
    for (j = 0; j < A_NCOLS; j++) {
      tin1Buf[i * A_NCOLS + j] = 1+i*A_NCOLS+j;
    }
  }
  for (i = 0; i < B_NROWS; i++) {  
    for (j = 0; j < B_NCOLS; j++) {
      tin2Buf[i * B_NCOLS + j] = rand() % (A_NCOLS * B_NCOLS);
    }
  }
  for (i = 0; i < A_NROWS; i++) {
    for (j = 0; j < B_NCOLS; j++) {
      toutBufSw[i * B_NCOLS + j] = 0.0;
      toutBufHw[i * B_NCOLS + j] = 0.0;
    }
  }
}

/**
* Compute Golden Result using software 
**/
void mmult_golden(float *in_arr,  float *in_arr2, float *out_arr)
{
  for (int row = 0; row < A_NROWS; row++) {
    for (int col = 0; col < B_NCOLS; col++) {
      float result = 0.0;
      for (int k = 0; k < A_NCOLS; k++) {
        result += in_arr[row*A_NCOLS+k] * in_arr2[k*B_NCOLS+col];
      }
      out_arr[row*A_NCOLS+col] = result;
    }
  }
}

/**
* Checking results from HW and SW 
**/
static int mmult_result_check(float *toutBufSw, float *toutBufHw)
{
  int i;
  
  for (i = 0; i < A_NROWS * B_NCOLS; i++) {
    if (toutBufSw[i] != toutBufHw[i]) {
      printf("Mismatch: data index=%d d=%f, dout=%f\n", i, toutBufSw[i], toutBufHw[i]);
      return 0;
    }
  }
  return 1;
}

/**
* Compute time elapse for HW and SW implementation 
**/
int mmult_test(float *tin1Buf,  float *tin2Buf, float *toutBufSw, float *toutBufHw)
{
  int i;
  
  printf("Testing mmult ...\n");
  
  mmult_init(tin1Buf, tin2Buf, toutBufSw, toutBufHw);

  TIME_STAMP_INIT

  for (i = 0; i < NUM_TESTS; i++) {
    mmult_golden(tin1Buf, tin2Buf, toutBufSw);
  }

  TIME_STAMP_SW

  for (i = 0; i < NUM_TESTS; i++)
    mmult_accel(tin1Buf, tin2Buf, toutBufHw);

  TIME_STAMP_ACCEL

  return mmult_result_check(toutBufSw, toutBufHw);
}

/************************** MAIN PROGRAM ***********************
**/
int main(int argc, char* argv[]){
  int test_passed = 0;
  float *tin1Buf, *tin2Buf, *toutBufSw, *toutBufHw;
  
  printf("Testing with A_NROWS = A_NCOLS = B_NCOLS = B_NROWS = %d\n", A_NROWS);

  // Allocate memory location for storing input and output data
  tin1Buf = (float *)malloc(A_NROWS * A_NCOLS * sizeof(float));
  tin2Buf = (float *)malloc(A_NCOLS * B_NCOLS * sizeof(float));
  toutBufHw = (float *)malloc(A_NROWS * B_NCOLS * sizeof(float));
  toutBufSw = (float *)malloc(A_NROWS * B_NCOLS * sizeof(float));

  if (!tin1Buf || !tin2Buf || !toutBufHw || !toutBufSw) {
    if (tin1Buf) free(tin1Buf);
    if (tin2Buf) free(tin2Buf);
    if (toutBufHw) free(toutBufHw);
    if (toutBufSw) free(toutBufSw);
    return 2;
  }

  test_passed = mmult_test(tin1Buf, tin2Buf, toutBufSw, toutBufHw);

  free(tin1Buf);
  free(tin2Buf);
  free(toutBufHw);
  free(toutBufSw);
  
  printf("TEST %s\n", test_passed ? "PASSED" : "FAILED");
  
  return 0;
}
