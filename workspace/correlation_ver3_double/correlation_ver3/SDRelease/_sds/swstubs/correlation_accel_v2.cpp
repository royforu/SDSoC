/************************************************************************
 * TU Kaiserslautern - Microelectronics									*
 * Author:  Trung C. Nguyen												*
 * Project: Financial Correlation Computation - Master thesis			*
 * File:	"correlation_core_axis_v1.cpp"								*
 * Current version: v2.00												*
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
 * 		- v0.05 :   Combine 2 AXI master								*
 * 		- v1.00 :	- Oct. 05 2016										*
 * 					Changing v0.03 to ultilize parallelism 				*
 * 		- v2.00 :   Move to SDSoC										*
 *																		*
 *************************************************************************/
#include "correlation_accel_v2.hpp"

#ifdef __SDSVHLS__
#include "ap_axi_sdata.h"
#endif

/*=======================================================================*/
/****************** 	TOP FUNCTION - CORE 	**************************/
/*=======================================================================*/
#ifdef __SDSVHLS__

void correlation_accel_v2(		int 	number_of_days,										/* CPU in*/
								int 	number_of_indices,									/* CPU in*/

								ap_axiu<32,1,1,1> in_indices[MAX_NUM_INDICES * MAX_NUM_DAYS],
           						ap_axiu<32,1,1,1> out_correlation[MAX_NUM_INDICES / 2 * (MAX_NUM_INDICES - 1)] )
#else
void correlation_accel_v2(
								// const int 			number_of_days,							/* CPU in*/
								// const int 			number_of_indices,						/* CPU in*/
								// hls::stream<float> 	&in_indices,								/*  Input*/
								// hls::stream<axis_t> &out_correlation 						/* Output*/
								// )

								int 	number_of_days,										/* CPU in*/
								int 	number_of_indices,									/* CPU in*/

								float	in_indices[MAX_NUM_INDICES * MAX_NUM_DAYS],			/*  Input*/
								float   out_correlation[MAX_NUM_INDICES / 2 * (MAX_NUM_INDICES - 1)]
								)
#endif
{

#ifdef __SDSVHLS__
#pragma HLS interface axis  port=out_correlation
#pragma HLS interface axis  port=in_indices
#pragma HLS interface ap_ctrl_hs port=return

	volatile ap_axiu<32,1,1,1> tmp1;
    union {
          int ival;
          float floatval;
     } conv1;
#endif

	const int NUMBER_OF_DAYS 			= number_of_days;
	const int NUMBER_OF_INDICES 		= number_of_indices;

	/*----------------------------------------------------------*
	 * PART 1: WEIGHT ROOM Initialization 						*
	 * ---------------------------------------------------------*/
	static float weight_rom[BRAM_ROM_SIZE];
	weight_rom_init(weight_rom, NUMBER_OF_DAYS);
	float sum_weight = weight_rom[0];

	/*----------------------------------------------------------*
	 * PART 2: Correlation Comp. Core 							*
	 * ---------------------------------------------------------*/
	// BRAM Declaration to store lnReturn of the first index of a row
	static float lnReturnA[BRAM_ROM_SIZE];

	// Channels to store accumulation
	float acc_return[ACCUM_PARTITION];
	float acc_weight_returnSquare[ACCUM_PARTITION];
	float acc_weight_return[ACCUM_PARTITION];
	float acc_weight_returnA_returnB[ACCUM_PARTITION];

	float shift_reg[2];

	#ifdef __SDSVHLS__
	#pragma HLS ARRAY_PARTITION variable=shift_reg complete dim=1
	#endif

	// Storing result of the first index of a row
	float sum_returnA				= 0.0f;
	float sum_weight_returnSquareA	= 0.0f;
	float sum_weight_returnA 		= 0.0f;

	/*----------------------------------------------------
	 * Step 1: Handling the first index of the row 	 	 -
	 * --------------------------------------------------*/
	// 1.1: Reset all accumulated channels
	RESET_REGISTERS_FIRST_INDEX:
		for(int i = 0; i < ACCUM_PARTITION; i++){
		#ifdef __SDSVHLS__
		#pragma HLS UNROLL		/*< FULLY UNROLL */
		#endif
			acc_return[i] 					= 0.0f;
			acc_weight_returnSquare[i]		= 0.0f;
			acc_weight_returnSquare[i]		= 0.0f;
			acc_weight_return[i]			= 0.0f;
	}

	// 1.2: Feed the first index
	#ifdef __SDSVHLS__
           conv1.ival  	= in_indices[0].data;
           shift_reg[1] = conv1.floatval;
           tmp1.keep  	= in_indices[0].keep;
           tmp1.strb  	= in_indices[0].strb;
           tmp1.user  	= in_indices[0].user;
           tmp1.last  	= in_indices[0].last;
           tmp1.id   	= in_indices[0].id;
           tmp1.dest  	= in_indices[0].dest;
	#else
           shift_reg[1] = in_indices[0];
	#endif

	ACCUMULATION_LOOP_FIRST_INDEX:
		for(int i = 1; i <= NUMBER_OF_DAYS - 1; i++){
		#ifdef __SDSVHLS__
		#pragma HLS PIPELINE
			if(i == 1){
               conv1.ival  		= in_indices[i].data;
               shift_reg[0] 	= conv1.floatval;
               tmp1.keep  		= in_indices[i].keep;
               tmp1.strb  		= in_indices[i].strb;
               tmp1.user  		= in_indices[i].user;
               tmp1.last  		= in_indices[i].last;
               tmp1.id    		= in_indices[i].id;
               tmp1.dest  		= in_indices[i].dest;
           } else {
				shift_reg[1]	=  shift_reg[0];

				conv1.ival  	= in_indices[i].data;
               	shift_reg[0]	= conv1.floatval;
               	tmp1.keep  		= in_indices[i].keep;
               	tmp1.strb  		= in_indices[i].strb;
               	tmp1.user  		= in_indices[i].user;
               	tmp1.last  		= in_indices[i].last;
               	tmp1.id    		= in_indices[i].id;
               	tmp1.dest  		= in_indices[i].dest;
			}
		#else
			if(i == 1){
              	shift_reg[0] 	= in_indices[i];
			}
            else {
            	shift_reg[1] 	= shift_reg[0];
            	shift_reg[0] 	= in_indices[i];
              }
		#endif
	
			// Receiving input stream and shifting registers

			float lnReturn						= logf(shift_reg[1]/shift_reg[0]);
			float weight						= weight_rom[i];

			// channel
			int channel 						= i%ACCUM_PARTITION;
			// Return Accumulation
			acc_return[channel]					+= lnReturn;

			// Weight * return square Accumulation
			acc_weight_returnSquare[channel] 	+= lnReturn * lnReturn * weight;

			// Weight * return Accumulation
			acc_weight_return[channel]			+= lnReturn * weight;

			// Weight * returnA * returnB Accumulation
			lnReturnA[i - 1] 					=	lnReturn;
		}

	// 1.3: Final stage of accumulation
	LAST_ACCUM_LOOP_FIRST_INDEX:
	for(int i = 0; i < ACCUM_PARTITION; i++){
	#ifdef __SDSVHLS__
	#pragma HLS PIPELINE II=5
	#endif
		sum_returnA 							+= acc_return[i];
		sum_weight_returnSquareA				+= acc_weight_returnSquare[i];
		sum_weight_returnA 						+= acc_weight_return[i];
	}

	/*----------------------------------------------------
	 * STEP 2: Handling the floating indices of a row 	 -
	 * --------------------------------------------------*/
	for(int column_index = 1; column_index < NUMBER_OF_INDICES; column_index ++){
		// 2.1: Reset all accumulated channels
		RESET_REGISTERS:
			for(int i = 0; i < ACCUM_PARTITION; i++){
			#ifdef __SDSVHLS__
			#pragma HLS UNROLL		/*< FULLY UNROLL */
			#endif
				acc_return[i] 					= 0.0f;
				acc_weight_returnSquare[i]		= 0.0f;
				acc_weight_returnSquare[i]		= 0.0f;
				acc_weight_return[i]			= 0.0f;
				acc_weight_returnA_returnB[i]	= 0.0f;
			}

			int index = column_index * NUMBER_OF_DAYS;

		// 2.2: Feed index
		#ifdef __SDSVHLS__
           conv1.ival  	= in_indices[index].data;
           shift_reg[1] = conv1.floatval;
           tmp1.keep  	= in_indices[index].keep;
           tmp1.strb  	= in_indices[index].strb;
           tmp1.user  	= in_indices[index].user;
           tmp1.last  	= in_indices[index].last;
           tmp1.id   	= in_indices[index].id;
           tmp1.dest  	= in_indices[index].dest;
		#else
           shift_reg[1] = in_indices[index];
		#endif

		ACCUMULATION_LOOP_FLOATING_INDEX:
			for(int i = 1; i <= NUMBER_OF_DAYS - 1; i++){
			#ifdef __SDSVHLS__
			#pragma HLS PIPELINE
				if(i == 1){
	               conv1.ival  		= in_indices[index + i].data;
	               shift_reg[0] 	= conv1.floatval;
	               tmp1.keep  		= in_indices[index + i].keep;
	               tmp1.strb  		= in_indices[index + i].strb;
	               tmp1.user  		= in_indices[index + i].user;
	               tmp1.last  		= in_indices[index + i].last;
	               tmp1.id    		= in_indices[index + i].id;
	               tmp1.dest  		= in_indices[index + i].dest;
	           } else {
					shift_reg[1]	=  shift_reg[0];

					conv1.ival  	= in_indices[index + i].data;
	               	shift_reg[0]	= conv1.floatval;
	               	tmp1.keep  		= in_indices[index + i].keep;
	               	tmp1.strb  		= in_indices[index + i].strb;
	               	tmp1.user  		= in_indices[index + i].user;
	               	tmp1.last  		= in_indices[index + i].last;
	               	tmp1.id    		= in_indices[index + i].id;
	               	tmp1.dest  		= in_indices[index + i].dest;
				}
			#else
				if(i == 1){
	              	shift_reg[0] 	= in_indices[index + i];
				}
	            else {
	            	shift_reg[1] 	= shift_reg[0];
	            	shift_reg[0] 	= in_indices[index + i];
	              }

			#endif

				float lnReturn		= logf(shift_reg[1]/shift_reg[0]);
				float weight		= weight_rom[i];

				// channel
				int channel 						= i%ACCUM_PARTITION;

				// Return Accumulation
				acc_return[channel]					+= lnReturn;

				// Weight * return square Accumulation
				acc_weight_returnSquare[channel] 	+= lnReturn * lnReturn * weight;

				// Weight * return Accumulation
				acc_weight_return[channel]			+= lnReturn * weight;

				// Weight * returnA * returnB Accumulation
				acc_weight_returnA_returnB[channel] += lnReturnA[i - 1] * lnReturn * weight;
			}

		// 2.3: Final stage of accumulation
		float sum_return 					= 0.0f;
		float sum_weight_returnSquare 		= 0.0f;
		float sum_weight_return 			= 0.0f;
		float sum_weight_returnA_returnB 	= 0.0f;

		LAST_ACCUM_LOOP:
		for(int i = 0; i < ACCUM_PARTITION; i++){
		#ifdef __SDSVHLS__
		#pragma HLS PIPELINE II=5
		#endif
			sum_return 					+= acc_return[i];
			sum_weight_returnSquare		+= acc_weight_returnSquare[i];
			sum_weight_return 			+= acc_weight_return[i];
			sum_weight_returnA_returnB 	+= acc_weight_returnA_returnB[i];
		}

		// 3: Compute Volatility, Covariance and Correlation
		float meanReturnA =  sum_returnA / float(NUMBER_OF_DAYS - 1);
		float meanReturnB =  sum_return / float(NUMBER_OF_DAYS - 1);

		float volatilityA = sqrtf((sum_weight_returnSquareA - 2.0f *	\
							meanReturnA * sum_weight_returnA)/ sum_weight	\
							+  (meanReturnA * meanReturnA));
		float volatilityB = sqrtf((sum_weight_returnSquare - 2.0f *	\
							meanReturnB * sum_weight_return)/ sum_weight	\
							+  (meanReturnB * meanReturnB));
		float covariance  = (sum_weight_returnA_returnB - meanReturnA *		\
							sum_weight_return - meanReturnB *				\
							sum_weight_returnA)/ sum_weight					\
							+ meanReturnA * meanReturnB;
		float corr_temp = covariance / (volatilityA * volatilityB);



		#ifdef __SDSVHLS__
		#pragma HLS PIPELINE II=1
               conv1.floatval 							= corr_temp;
               out_correlation[column_index - 1].data  	= conv1.ival;
               out_correlation[column_index - 1].keep  	= 15;
               out_correlation[column_index - 1].strb  	= 1;
               out_correlation[column_index - 1].user  	= 0;
               out_correlation[column_index - 1].last  	= (column_index == (NUMBER_OF_INDICES - 1)) ? 1 : 0;
               out_correlation[column_index - 1].id    	= 0;
               out_correlation[column_index - 1].dest  	= 0;
		#else
               out_correlation[column_index - 1] = corr_temp;
		#endif
	}

}

#include <stdio.h>
#include <stdlib.h>
#include "cf_stub.h"
void _p0_correlation_accel_v2_0(int number_of_days, int number_of_indices, float in_indices[2520000], float out_correlation[49995000]);
void _p0_correlation_accel_v2_0(int number_of_days, int number_of_indices, float in_indices[2520000], float out_correlation[49995000])
{
  switch_to_next_partition(0);
  int start_seq[3];
  start_seq[0] = 0x00000300;
  start_seq[1] = 0x00010000;
  start_seq[2] = 0x00020000;
  cf_request_handle_t _p0_swinst_correlation_accel_v2_0_cmd;
  cf_send_i(&(_p0_swinst_correlation_accel_v2_0.cmd_correlation_accel_v2), start_seq, 3*sizeof(int), &_p0_swinst_correlation_accel_v2_0_cmd);
  cf_wait(_p0_swinst_correlation_accel_v2_0_cmd);


#ifdef SDS_DEBUG
  if ((number_of_indices*number_of_days) * 4 != 2520000*4)
    printf("in_indices of function correlation_accel_v2 transfer size is different from declared size, system may hang!\n");
  if ((number_of_indices-1) * 4 != 49995000*4)
    printf("out_correlation of function correlation_accel_v2 transfer size is different from declared size, system may hang!\n");
#endif

  cf_send_i(&(_p0_swinst_correlation_accel_v2_0.number_of_days), &number_of_days, 4, &_p0_request_0);
  cf_send_i(&(_p0_swinst_correlation_accel_v2_0.number_of_indices), &number_of_indices, 4, &_p0_request_1);
  cf_send_i(&(_p0_swinst_correlation_accel_v2_0.in_indices), in_indices, (number_of_indices*number_of_days) * 4, &_p0_request_2);

  cf_receive_i(&(_p0_swinst_correlation_accel_v2_0.out_correlation), out_correlation, (number_of_indices-1) * 4, &_p0_correlation_accel_v2_0_num_out_correlation, &_p0_request_3);


  cf_request_handle_t req_array[4] = {_p0_request_0, _p0_request_1, _p0_request_2, _p0_request_3};
  sds_insert_req(2, req_array, 4);
}
void _p0_correlation_accel_v2_1(int number_of_days, int number_of_indices, float in_indices[2520000], float out_correlation[49995000]);
void _p0_correlation_accel_v2_1(int number_of_days, int number_of_indices, float in_indices[2520000], float out_correlation[49995000])
{
  switch_to_next_partition(0);
  int start_seq[3];
  start_seq[0] = 0x00000300;
  start_seq[1] = 0x00010000;
  start_seq[2] = 0x00020000;
  cf_request_handle_t _p0_swinst_correlation_accel_v2_1_cmd;
  cf_send_i(&(_p0_swinst_correlation_accel_v2_1.cmd_correlation_accel_v2), start_seq, 3*sizeof(int), &_p0_swinst_correlation_accel_v2_1_cmd);
  cf_wait(_p0_swinst_correlation_accel_v2_1_cmd);


#ifdef SDS_DEBUG
  if ((number_of_indices*number_of_days) * 4 != 2520000*4)
    printf("in_indices of function correlation_accel_v2 transfer size is different from declared size, system may hang!\n");
  if ((number_of_indices-1) * 4 != 49995000*4)
    printf("out_correlation of function correlation_accel_v2 transfer size is different from declared size, system may hang!\n");
#endif

  cf_send_i(&(_p0_swinst_correlation_accel_v2_1.number_of_days), &number_of_days, 4, &_p0_request_4);
  cf_send_i(&(_p0_swinst_correlation_accel_v2_1.number_of_indices), &number_of_indices, 4, &_p0_request_5);
  cf_send_i(&(_p0_swinst_correlation_accel_v2_1.in_indices), in_indices, (number_of_indices*number_of_days) * 4, &_p0_request_6);

  cf_receive_i(&(_p0_swinst_correlation_accel_v2_1.out_correlation), out_correlation, (number_of_indices-1) * 4, &_p0_correlation_accel_v2_1_num_out_correlation, &_p0_request_7);


  cf_request_handle_t req_array[4] = {_p0_request_4, _p0_request_5, _p0_request_6, _p0_request_7};
  sds_insert_req(1, req_array, 4);
}



/*==========================================================================*/
/********************** 	SUB FUNCTIONS 		*****************************/
/*==========================================================================*/
/**********************     weight_rom_init     *****************************
 * A ROM stores weight of individual days									*
 * The first cell is used to store sum of all weights						*
 *																			*
 * @param    	Static array with with size of BRAM_ROM_SIZE				*
 * 				(extra cell to store sum)									*
 * @return:		None														*
 *																			*
 * @example:																*
 * 		Sample view:														*
 * 			[0]   				|	sum of weight							*
 * 			[1]   				|	1										*
 * 			[2]					|	0.94									*
 *  		:					:	:										*
 *  							:	:										*
 * 		[BRAM_ROM_SIZE - 1]		|	...										*
 *																			*
 * @Note:																	*
 * 		Do not need to store weight of the earliest day.					*
 * 		Since we do not have log(return) of that day						*
 *--------------------------------------------------------------------------*/
static void weight_rom_init(
		float weightRom[BRAM_ROM_SIZE],
		int NUMBER_OF_DAYS)
{
	float lambda 		= 0.94f;
	weightRom[0]		= 1.0f;						/*< store sum of weight */
	weightRom[1] 		= 1.0f;								/*< lastest day */

	INIT_WEIGHT_ROM:
	for(int i = 2; i < BRAM_ROM_SIZE; i++) {
		weightRom[i] 	= lambda * weightRom[i - 1];
	}

	COMP_SUM_OF_WEIGHT:
	for(int i = 2; i < NUMBER_OF_DAYS; i++){
		weightRom[0]	+= weightRom[i]; 				/*< Accumulate sum of
																	* weight */
	}
}

