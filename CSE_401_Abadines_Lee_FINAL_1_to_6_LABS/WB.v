`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: WB.v
Lab: 5
Date: May 26th, 2016

The write-back stage consists of only one module: a multiplexer. Its output goes to reg.v as the input for write_data of I_DECODE. 
The inputs are mem_Read_data, mem_ALU_result, and MemtoReg which are the outputs of the MEM/WB latch.
*/
module WB(
	input 	wire [31:0]	mem_Read_data,
	input	wire [31:0]	mem_ALU_result,
	input 	wire 			MemtoReg,
	output	wire	[31:0]wb_data
    );
	 
	mux mux_5(.y(wb_data), // output
				.a(mem_Read_data),
				.b(mem_ALU_result),
				.sel(MemtoReg));


endmodule
