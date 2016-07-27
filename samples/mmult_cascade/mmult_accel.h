#ifndef MMULT_ACC_H_
#define MMULT_ACC_H_

#define A_NROWS 16
#define A_NCOLS 16
#define B_NCOLS 16
#define B_NROWS A_NCOLS

void mmult_accel (float in_A[A_NROWS*A_NCOLS],
                  float in_B[A_NCOLS*B_NCOLS],
                  float out_C[A_NROWS*B_NCOLS]);

#endif /* MMULT_ACC_H_ */

