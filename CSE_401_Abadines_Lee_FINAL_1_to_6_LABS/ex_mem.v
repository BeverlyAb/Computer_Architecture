`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: ex_mem.v
Lab: 3
Date: May 18th, 2016

This is the latch that receives signals form all the modules of the execute stage. Its outputs go to MEM/WB and FETCH.
*/
module ex_mem(
	input		wire	[1:0]		ctlwb_out,
	input		wire	[2:0]		ctlm_out,
	input		wire	[31:0]	adder_out,
	input		wire				aluzero,
	input		wire	[31:0]	aluout, readdat2,
	input		wire	[4:0]		muxout,
	output	reg	[1:0]		wb_ctlout,
	output	reg				branch, memread, memwrite, //output of M control line from ID/EX latch (lab 2-2)
	output	reg	[31:0]	add_result,
	output	reg				zero,
	output	reg	[31:0]	alu_result, rdata2out,
	output	reg	[4:0]		five_bit_muxout
    );

	initial begin
		wb_ctlout <= 0; 
		branch <= 0; memread <= 0; memwrite <= 0;
		add_result <= 0;
		zero <= 0;
		alu_result <= 0; rdata2out <= 0;
		five_bit_muxout <= 0;
	end

	always@* begin
		#1 //Update Delay
		
		//Use Fig 3.7 to assign the inputs to the outputs 
		wb_ctlout <= ctlwb_out;
		branch <= ctlm_out[2];    
		memread <= ctlm_out[1];       
		memwrite <= ctlm_out[0];     
                   	                          
      add_result <= adder_out;   
		zero <= aluzero;
		alu_result <= aluout;
		rdata2out <= readdat2;
		five_bit_muxout <= muxout;
	end

endmodule // ex_mem
