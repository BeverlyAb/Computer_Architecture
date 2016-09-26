`timescale 1ns / 1ps

/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: ifetch.v
Lab: 1
Date: May 3rd, 2016

Test the s_extends module. Refer to s_extend.v
The display works well here. Use display as template for other test benches. 
*/
module s_extends_testbench;

	// Inputs
	reg [15:0] nextend;

	// Outputs
	wire [31:0] extend;

	// Instantiate the Unit Under Test (UUT)
	s_extend uut (
		.nextend(nextend), 
		.extend(extend)
	);

	initial begin
		// Initialize Inputs
		nextend = 16'b0;
      #5;  
		nextend = 16'b 0000000000010011; //16'h13
		
		#5
		nextend = 16'b 1000000000011011; //16'h801b
	end
	
	always @(extend)
		#1 $display ("Time = %0d \t nextend = %0b \t extend = %0b",
			$time, nextend, extend); 	
      
endmodule

