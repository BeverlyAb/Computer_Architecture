`timescale 1ns / 1ps
/* Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: mem_wb.v
Lab: 4
Date: May 24th, 2016

This is the latch that receives signals form all the modules of the memory stage. Its outputs go to mux of WRITE-BACK Stage and FETCH.
*/
module mem_wb(
	input	wire	[1:0]	control_wb_in,
	input	wire	[31:0]	read_data_in, alu_result_in,
	input	wire	[4:0]	write_reg_in,
	output	reg		regwrite, memtoreg, //1 bit wire
	output	reg	[31:0]	read_data, mem_alu_result,
	output	reg	[4:0]	mem_write_reg
    );

initial begin
	regwrite <= 0;
	memtoreg <= 0;
	
	read_data <= 0;
	mem_alu_result <= 0;
	mem_write_reg <= 0;
	
	//finish this thread
end

always@* begin
	#1
	regwrite <= control_wb_in[1]; // refer to Lab 2-2 Figure 2.2
	memtoreg <= control_wb_in[0];
	
	read_data <= read_data_in;
	mem_alu_result <= alu_result_in;
	mem_write_reg <= write_reg_in;
	
end

endmodule // mem_wb
