`timescale 1ns / 1ps

/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: control.v
Lab: 2
Date: May 3rd, 2016

Receives 6 bits of the instruction code from ifetch.v (originally 32 bits) as an opcode
and divides it into execution/address, memory access, and write-back control lines.

This module applies switch statements and should be used for review.  
*/


module control (
    input	wire	[5:0] opcode,
    output	reg	[3:0] EX,
    output	reg	[2:0] M,
    output	reg	[1:0] WB
    );
	 
	parameter RTYPE	= 6'b000000; // Parameters are constants, can be overwritten 
	parameter LW	= 6'b100011;
	parameter SW	= 6'b101011;
	parameter BEQ	= 6'b000100;
	parameter NOP	= 6'b100000;	
	
	initial begin
		 /*  
		     We assign decimal representation of 0 to our outpur REG's here. 
		     Note the difference 
		 */
		EX <= 0;
		M <= 0;
		WB <= 0;
	end

	/* Assign the don't cares (X) to high impedence (Z)...
	   For design correctness and more proper MIPS emulation 
	*/
	always@* begin
		case (opcode)
			RTYPE: begin
				EX <= 4'b1100; /* Note use of non-blocking  operator ( <= ) versus blocking  operator( = ) */
				M  <= 3'b000; 
				WB <= 2'b10;
			end
			/* Assign remaining values according to chart in Lab Manuel.
		     Either paramterize it, or hardcode at as is done for RTYPE.
		  */
			LW: begin
				EX <= 4'b0001; 
				M  <= 3'b010; 
				WB <= 2'b11;
			end
			SW: begin
				EX <= 4'b0001;  //why not 4'bZ001
				M  <= 3'b001;
				WB <= 2'b0Z;	
			 end
			BEQ: begin
				EX <= 4'b0010;	// why not 4'bZ010
				M  <= 3'b100;
				WB <= 2'b0Z;	
			end
			
			NOP: //Not in Lab Manual, but needed to make life easier for final implementation
			begin  
				EX <={4{1'b0}};  //replicating operator 
				M  <={3{1'b0}}; 
				WB <={2{1'b0}};
			end
			default:	$display ("Opcode not recognized.");
		endcase
	end

endmodule 
