`timescale 1ns / 1ps

/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: pc_test.v
Lab: 2
Date: May 3rd, 2016

Test the pc module. Refer to pc_counter.v 
*/
module pc_test;

	// Inputs
	reg [31:0] npc;

	// Outputs
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	pc_counter uut (
		.PC(PC), 
		.npc(npc)
	);

	initial begin
		// Initialize Inputs
		npc = 0;
		#10;
		
		npc = 1;
		#10;
		
		npc = 2;
		#10; 
		
		npc = 3;
		#10;
		
		npc = 4;
		#10;

	end
	
	always @(npc)
		#1 $display ("Time = %0d \t npc = %0d \t PC = %0d",
			$time, npc, PC); 
      
endmodule

