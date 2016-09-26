`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: adder_testbench.v
Lab: 3
Date: May 18th, 2016


Adds two 32 bit positve integers and outputs a 32 bit integer. 
*/

module adder_testbench;

	// Inputs
	reg [31:0] add_in1;
	reg [31:0] add_in2;

	// Outputs
	wire [31:0] add_out;

	// Instantiate the Unit Under Test (UUT)
	adder uut (
		.add_in1(add_in1), 
		.add_in2(add_in2), 
		.add_out(add_out)
	);

	initial begin
		// Initialize Inputs
		add_in1 = 0;
		add_in2 = 0;
		
		#5;
		add_in1 = 1;
		add_in2 = 2;
		
		#5;
		add_in1 = -10;
		add_in2 = 5;

		#5;
		add_in1 = 10500000;
		add_in2 = 0;
	end
      always @(add_out)
		#1 $display ("Time = %0d \t add_in1 = %0d \t add_in2 = %0d \t add_out = %0d",
			$time, add_in1, add_in2, add_out); 	
      
endmodule

