`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: ifetch.v
Lab: 1
Date: April 21, 2016

Implements the instruction fetch module, which consists of the previous five
modules (mux, PC, memory, IF/ID register, and incrementer).
*/

module I_FETCH (
   output wire  [31:0] IF_ID_instr, // wire transfer data, reg store data
   output wire  [31:0] IF_ID_npc,
   input  wire         EX_MEM_PCSrc,
   input  wire  [31:0] EX_MEM_NPC
   );
   
//signals
   wire [31:0] PC;
   wire [31:0] dataout;
   wire [31:0] npc,npc_mux;

   //instantiations
   mux mux1 (.y(npc_mux), 
				 .a(EX_MEM_NPC), // .baseClass_var(currentClass_var)
             .b(npc), 			// a = 1, b = 0
             .sel(EX_MEM_PCSrc));
                
   pc_counter pc_counter1 (.PC(PC), //output
                   .npc(npc_mux));	//input
                   
   memory memory1 (.data(dataout),	//output
                   .addr(PC));		//input
                   
   if_id  if_id1 	(.instr(dataout), 		// inputs
                   .npc(npc),
						 .instrout(IF_ID_instr), // outputs
                   .npcout(IF_ID_npc));
                   
   incrementer incrementer1 (.pcout(npc), //output
                             .pcin(PC));	//input
   initial begin
    //  $display("Time\t PC\t npc\t dataout of MEM\t IF_ID_instr\t IF_ID_npc");
    // $monitor("%0d\t %0d\t %0d\t %b\t %b\t %0d", $time, PC, npc, dataout,IF_ID_instr,IF_ID_npc);
      #24 $finish;
   end                          

endmodule // I_FETCH
