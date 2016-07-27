// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.4
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ==============================================================


`timescale 1ns/1ps

module mmult_accel_fadd_32ns_32ns_32_9_full_dsp
#(parameter
    ID         = 1,
    NUM_STAGE  = 9,
    din0_WIDTH = 32,
    din1_WIDTH = 32,
    dout_WIDTH = 32
)(
    input  wire                  clk,
    input  wire                  reset,
    input  wire                  ce,
    input  wire [din0_WIDTH-1:0] din0,
    input  wire [din1_WIDTH-1:0] din1,
    output wire [dout_WIDTH-1:0] dout
);
//------------------------Local signal-------------------
wire                  aclk;
wire                  aclken;
wire                  a_tvalid;
wire [31:0]           a_tdata;
wire                  b_tvalid;
wire [31:0]           b_tdata;
wire                  r_tvalid;
wire [31:0]           r_tdata;
reg  [din0_WIDTH-1:0] din0_buf1;
reg  [din1_WIDTH-1:0] din1_buf1;
//------------------------Instantiation------------------
mmult_accel_ap_fadd_7_full_dsp_32 mmult_accel_ap_fadd_7_full_dsp_32_u (
    .aclk                 ( aclk ),
    .aclken               ( aclken ),
    .s_axis_a_tvalid      ( a_tvalid ),
    .s_axis_a_tdata       ( a_tdata ),
    .s_axis_b_tvalid      ( b_tvalid ),
    .s_axis_b_tdata       ( b_tdata ),
    .m_axis_result_tvalid ( r_tvalid ),
    .m_axis_result_tdata  ( r_tdata )
);
//------------------------Body---------------------------
assign aclk     = clk;
assign aclken   = ce;
assign a_tvalid = 1'b1;
assign a_tdata  = din0_buf1==='bx ? 'b0 : din0_buf1;
assign b_tvalid = 1'b1;
assign b_tdata  = din1_buf1==='bx ? 'b0 : din1_buf1;
assign dout     = r_tdata;

always @(posedge clk) begin
    if (ce) begin
        din0_buf1 <= din0;
        din1_buf1 <= din1;
    end
end

endmodule
