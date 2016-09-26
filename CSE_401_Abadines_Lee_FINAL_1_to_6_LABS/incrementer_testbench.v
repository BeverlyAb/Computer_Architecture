`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: ifetch.v
Lab: 2
Date: May 3rd, 2016

Test incrementer. Pcout should be greater than A by 1.
*/

module incrementer_testbench;

	// Inputs
	reg [31:0] pcin;

	// Outputs
	wire [31:0] pcout;

	// Instantiate the Unit Under Test (UUT)
	incrementer uut (
		.pcout(pcout), 
		.pcin(pcin)
	);

	initial begin
		// Initialize Inputs
		#10; 		// Time = 11
		pcin = 3;
		#10;		// Time 21
		pcin = 15;
		#10;		// Time 31
		pcin = 64;
		#5;		// Time 36
	end
	
	always @(pcin)
		#1 $display ("Time = %0d \t A = %0d \t pcout = %0d",
			$time, pcin, pcout);    
endmodule

