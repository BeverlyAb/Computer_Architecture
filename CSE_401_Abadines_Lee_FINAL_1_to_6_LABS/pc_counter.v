`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: pc_counter.v
Lab: 1
Date: April 21, 2016

Implements a program counter (PC) that stores address of next instruction.
*/
module pc_counter(
	output reg [31:0] PC,             // Output of pc_mod
	input wire [31:0] npc             // Input of pc_mod
);

   initial begin
      PC <= 0;
   end
	
   always @ ( npc) begin
      #1 PC <= npc;							// Non-blocking assignment for PC = npc
   end

endmodule // pc_counter
