`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: mux.v
Lab: 1
Date: April 21, 2016

Implements a multiplexer that selects from two inputs, a and b, based 
on the sel input. 
*/

module mux(
	output wire [31:0] y, 		// output of mux
	input  wire [31:0] a, b, 	// input a = 1'b1, b = 1'b0
	input  wire sel			// select, single bit
    );
	 
	assign y = sel ? a: b;	// the type after assign must be WIRE
									// if sel = 1, then y = a
									// if sel = 0, then y = b
endmodule	// mux
