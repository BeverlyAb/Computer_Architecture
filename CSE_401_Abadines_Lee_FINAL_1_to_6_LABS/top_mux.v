`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: top_mux.v
Lab: 3
Date: May 18th, 2016

Implements a multiplexer that selects from two inputs (32 bits), a and b, based 
on the sel input. 

Its inputs are rdata2 ID/EX latch and aluscr from alu_control.v 
The output becomes the b input of alu.v
*/
module top_mux(
	output wire [31:0] y, 		// output of mux
	input  wire [31:0] a, b, 	// input a = 1'b1, b = 1'b0
	input  wire alusrc			// select, single bit
    );
	 
	assign y = alusrc ? a: b;	// the type after assign must be WIRE
									// if sel = 1, then y = a
									// if sel = 0, then y = b
endmodule	// top_mux
