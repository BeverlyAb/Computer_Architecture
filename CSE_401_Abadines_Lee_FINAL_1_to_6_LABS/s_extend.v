`timescale 1ns / 1ps

/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: s_extend.v
Lab: 2
Date: May 3rd, 2016

Sign extends 16 bits into 32 bits. This maintains the characteristics of a positive or
negative number.
*/

module s_extend(
    input	wire	[15:0] nextend,
    output	reg	[31:0] extend
    );

	always@ * 
	  begin
		// Replicate signed bit 16 times then concatinate
		// EX) {n {m}} , replicates m "n" times
		// EX) {4'b1001,4'b10x1} , becomes 100110x1   
		extend <= {{16{nextend[15]}}, nextend};		
		end

endmodule
