/************************************************************************
 * TU Kaiserslautern - Microelectronics									*
 * Author:  Trung C. Nguyen												*
 * Project: Financial Correlation Computation - Master thesis			*
 * File:	"correlationComp.h"	- v1 									*
 * Revision:															*
 * 		- v0.01	:	Create the file  - Aug. 11. 2016					*
 * 		- v0.02	:	Improve the core - Sep. 17 2016						*
 * 					+ Reduce 1 BRAM 252 * 4								*
 * 					+ Reduce latency - 252 clk							*
 * 					+ Reduce resource (29% Slice)						*
 * 		- v0.03 : 	- Sep. 20 2016										*
 * 					Using nested loop with the same algorithm as 		*
 * 					v0.02 												*
 * 		- v0.04	:	Changing from AXI STREAM to AXI MASTER				*
 * 					Do not need Xilinx DMA anymore						*
 * 					Sep.25 2016											*
 *		- v0.04.1	Same as v0.04 but using nested loop					*
 *																		*
 * 		- v1.00: 	Move to SDSoC										*
 ************************************************************************/
#ifndef CORRELATION_ACCL_H_
#define CORRELATION_ACCL_H_
/*==================================================================*/
/*-------------------------- Libraries -----------------------------*/
/*==================================================================*/
#include "hls_stream.h"
#include "hls_math.h"		/*< Math lib for synthesize - Co-Sim */
#include <cmath>			/*< Math lib for C-simulation */
#include "math.h"

#include <iostream>
#include <fstream>			/*< Stream class to both read and write
								* from/to files*/
#include <string.h>
#include <stdlib.h>			/*< atof */
#include <stdio.h>
/*==================================================================*/
/*-------------------------- Parameters ----------------------------*/
/*==================================================================*/
#ifndef BRAM_ROM_SIZE
#define BRAM_ROM_SIZE 		252				/*< Default*/
#endif

#define ALLOW_ERR_THRES 	0.00001f

#define MAX_NUM_INDICES 	10000
#define MAX_NUM_DAYS 		252

#define ACUM_PARTITION  	6
/*==================================================================*/
/*-------------------------- Type definition -----------------------*/
/*==================================================================*/
//typedef struct {
//	float 		data;
//	ap_uint<1>	last;
//} axis_t;
/*==================================================================*/
/****************** FUNCTION PROTOTYPES *****************************/
/*==================================================================*/
static void weight_rom_init(
		float 	weightRom[BRAM_ROM_SIZE],
		int 	NUMBER_OF_DAYS);

//#pragma SDS data copy(in_indices[0: number_of_indices * number_of_days])
//#pragma SDS data copy(out_correlation[0: number_of_indices * (number_of_indices - 1)/2])
#pragma SDS data sys_port(in_indices:AFI, out_correlation:AFI)
//#pragma SDS data data_mover(in_indices: AXIDMA_SIMPLE, out_correlation: AXIDMA_SIMPLE)
int correlation_accel_v1(
	int 	number_of_days,						/* CPU in*/
	int 	number_of_indices,					/* CPU in*/
	float	in_indices[MAX_NUM_INDICES * MAX_NUM_DAYS],			/*  Input*/
	float   out_correlation[MAX_NUM_INDICES / 2 * (MAX_NUM_INDICES - 1)]
);
#endif /* CORRELATION_ACCL_H */_
