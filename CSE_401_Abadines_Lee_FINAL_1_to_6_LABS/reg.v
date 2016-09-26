`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: register.v
Lab: 2
Date: May 3rd, 2016

The module populates thirty-two 32-bit addresses/registers with zero. For lab 2, RegWrite 
data is unspecified, but eventually it should come from MEM/WB from lab 6. This outputs two 32-bit registers,
A and B. A is the contents of register rs (source) and B is the contents of registers rt (target).
*/

module register(
    input [4:0] rs, // [25:21] IF_instr
    input [4:0] rt, // [20:16] IF_instr
    input [4:0] rd,
    input [31:0] writedata,
    input regwrite,
    output reg	[31:0] A,	// source
    output reg	[31:0] B		// target
    );

// Register Declaration
reg [31:0] REG [0:31]; //gives us 32 registers, each 32 bits long
integer i;
	
initial begin
	    A <= 0;
	    B <= 0;
		  
		  //initialize our 32 registers with the value zero
		 for (i = 0; i < 32; i = i + 1)
			    REG[i] <= 0;
     //display contents of the first 9 reigsters
     $display("From Register Memory:");
		 for (i = 0; i < 9; i = i + 1)
			 $display("\tREG[%0d] = %0d",i,REG[i]);
		
		//Display last register
		  $display("\t...");
		  $display("\tREG[%0d] = %0d", 31, REG[31]);
	end
	
always @ * begin
      A <= REG[rs];  // Assign the rs index of REG to A ;
		B <= REG[rt];  // Assign the rt index of REG to B ;
		
	  	// WRITE data using index rd
		  if (rd != 0 && regwrite) // 1 is on 
				REG[rd] <= writedata;
			
	end

//This Display is used for Lab 6			
always @ (writedata) begin
		  $display("\tREG[%0d] = %0d", 1, REG[1]);
	end
endmodule // register

