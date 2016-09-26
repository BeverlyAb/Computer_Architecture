`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: incrementer.v
Lab: 1
Date: April 21, 2016

Implements a incrementer that adds 1 to an input and outputs
the incremented value.
*/

module incrementer(
	output wire [31:0] pcout,
	input  wire [31:0] pcin
    );
		
	assign pcout = pcin + 1;

endmodule
