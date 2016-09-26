`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: alu_test.v
Lab: 3
Date: May 18th, 2016

Tests alu.v
*/

module alu_test;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [2:0] control;

	// Outputs
	wire [31:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.a(a), 
		.b(b), 
		.control(control), 
		.result(result), 
		.zero(zero)
	);

	initial begin
		a			<=	'b1010; 	// 10
		b			<=	'b0111;	// 7
		control	<= 'b011;
		
		$display("A = %b\t B = %b", a, b);
		$monitor("ALUop = %b\t result = %b\t zero = %b", control, result, zero);
		
		#1 
		control <= 'b100;
		#1 
		control <= 'b010;
		#1 
		control <= 'b111; // result = 0 check slt
		#1 
		control <= 'b011;
		#1 
		control <= 'b110;
		#1 
		control <= 'b001;	// result = 'b1111, check or
		#1 
		control <= 'b000;	// result = 'b10, check and
		#1
		$finish;
		
	end
      
endmodule

