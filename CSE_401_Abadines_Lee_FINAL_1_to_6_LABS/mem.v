`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: mem.v
Lab: 1
Date: May 3rd, 2016

Implements instruction memory that takes an address and outputs instruction
that corresponds to that location. 
*/

module memory (
   output reg [31:0] data,       // Output of Instruction Memory
   input wire [31:0] addr        // Input of Instruction Memory
   );

// Register Declarations
   reg [31:0] MEM[0:127];  // 128 words of 32-bit memory
	integer i;
/*// Initialized memory locations with values from lab 2
   initial begin
   MEM[0] <= 'h002300AA;
   MEM[1] <= 'h10654321;
   MEM[2] <= 'h00100022;
   MEM[3] <= 'h8C123456;
   MEM[4] <= 'h8F123456;
   MEM[5] <= 'hAD654321;
   MEM[6] <= 'h13012345;
   MEM[7] <= 'hAC654321;
   MEM[8] <= 'h12012345;
   end 
*/
	//for initializing instruction memory from risc.txt (lab 6)
	initial begin
		$readmemb("risc.txt", MEM);
		for (i = 0; i < 24; i = i + 1)
			//$display(MEM[i]);
			$display("\tMEM[%0d] = %0b", i, MEM[i]);
	end
	
   always @ (addr) data <= MEM[addr];
endmodule // memory
