`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: alu.v
Lab: 3
Date: May 18th, 2016

Takes in rdata1 as its input as well as "b," which is the output of top_mux.
It outputs result, later known as aluout, and zero, which is then aluzero for ex_mem.v.
This handles the logical and arithmetic correspondence.
*/
module alu(
    input	wire	[31:0]	a, 		// source from register
    input	wire	[31:0]	b,			// target from register
    input	wire	[2:0]		control, // select from alu_control
    output	reg	[31:0]	result,	// goes to MEM Data memory and MEM/WB latch
    output	wire				zero		// goes to MEM Branch
    );
	// Based on Lab 3-2 Instruction Operation and ALU control
	parameter	ALUadd		=	3'b010,
					ALUsub		=	3'b110,
					ALUand		=	3'b000,     
					ALUor			=	3'b001,
					ALUslt		=	3'b111;
	
	// Handles negative inputs
	wire sign_mismatch; // 1 bit
	
	//assign sign_mismatch = 1'b0; // Set this up so that the ALUslt conditions match
	assign sign_mismatch = a[31]^b[31]; //XOR operation; only returns 1 if bits are different 
	
	initial
		result <= 0;
	
	always@*
		case(control)
			ALUadd:			result = a + b;
			ALUsub:			result = a - b;
			ALUand:			result = a & b;	// changed to bit-wise AND, should not be logical AND
			ALUor:			result = a | b;	// changes to bit-wise OR,  should not be logical OR
			ALUslt:			result = a < b	?	1 - sign_mismatch 	// (1)
		 											: 0 + sign_mismatch;	//	(0) 		
			default:			result = 32'bX;	// control = ALUx | *
		endcase
		
		//	check to see if result is equal to zero. if it is assign it true (1), false (0) otherwise, meaning it is a non-zero number	
		/*	result = (condition1) ? rA :
						(condition2) ? rB :
                                 rC)	*/
		assign	zero = (result == 0) ? 1 : 0;
		
endmodule

//If the input information does not correspond to any valid instruction,
//aluop = 2'b11 which sets control = ALUx = 3'b011 
//and ALU output is 32 x's as required by lab manual. 
 
