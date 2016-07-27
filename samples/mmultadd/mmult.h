#ifndef _MMULT_H_
#define _MMULT_H_

#define A_NROWS 32
#define A_NCOLS 32
#define B_NCOLS 32
#define B_NROWS A_NCOLS

void mmult (float in_A[A_NROWS*A_NCOLS],
            float in_B[A_NCOLS*B_NCOLS],
            float out_C[A_NROWS*B_NCOLS]);

#endif /* _MMULT_H_ */

