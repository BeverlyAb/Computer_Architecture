`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: if_id.v
Lab: 1
Date: April 21, 2016

Implements an IF/ID pipeline register that inputs and outputs the program 
counter and instruction. 
*/

module if_id (
   output reg [31:0] instrout,       // Output of IF/ID Instruction Register
                       npcout,       // Output of IF/ID NPC Register
   input wire [31:0]    instr,       // Input of IF/ID Instruction Register
                          npc        // Input of IF/ID NPC Register
   );
   initial begin
      instrout <= 0;
      npcout   <= 0;
   end
	
   always @* begin
      #1 instrout <= instr;
           npcout <= npc;
   end
	
endmodule // if_id
