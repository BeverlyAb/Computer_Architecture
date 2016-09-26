`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: alu_control.v
Lab: 3
Date: May 18th, 2016

Takes in 6 bit of s_extendout with alu_op and outputs select, which is the control.
for alu.v This bridges machine language with assembly language.
*/


module alu_control(
    input	wire	[5:0]	funct, //from ID/EX latch (lab 2-2)
    input	wire	[1:0]	aluop,
    output	reg	[2:0]	select
    );
	
	//These are the function field paramters for Rtype. Use Fig 3.2 to complete
	// ALU Op
	parameter	Rtype 		=  2'b10; //this is a 2 bit parameter, will check later
				/*	Radd			=	2'b10,
					Rsub			=	2'b10,
					Rand			=	2'b10,
					Ror			=	2'b10,
					Rslt			=	2'b10; */
	// refer to Lab 2-2 or Lab 3-2, ALUOp
	parameter	lwsw			=	2'b00,		//since LW and SW use the same bit pattern, only way to store them as a paramter
					Itype			=	2'b01,		// beq, branch
					xis			=	6'bXXXXXX;	// not in diagrams, but assuming for don't care 
	// ALU Control Inputs Designation	
	parameter	ALUadd		=	3'b010,  //for R-type instructions
					ALUsub		=	3'b110,
					ALUand		=	3'b000,
					ALUor			=	3'b001,
					ALUslt		=	3'b111;
	//If the input information does not correspond to any valid instruction,
	//aluop = 2'b11 which sets control = ALUx = 3'b011 
	//and ALU output is 32 x's as required by lab manual. 			
	parameter	unknown		=	2'b11, //for invalid opcode, ALUop = 2'b11
					ALUx			=	3'b011;
	// Funct Field
	parameter	FUNCTadd		= 	6'b100000,
					FUNCTsub 	= 	6'b100010,
					FUNCTand 	= 	6'b100100,
					FUNCTor 		= 	6'b100101,
					FUNCTslt 	= 	6'b101010;
	initial
		select <= 0;
	
	always@* begin
		
		if (aluop == Rtype)
		 begin
			case(funct)
			   //assign the correct select value based on the function field.
				//Use Fig 3.2 to aid you in this.
				// Desired ALU action
				FUNCTadd:			select <= ALUadd;
				FUNCTsub:			select <= ALUsub;
				FUNCTand:			select <= ALUand;
				FUNCTor:			select <= ALUor;
				FUNCTslt:			select <= ALUslt;
				default:		select <= ALUx;
			endcase
	    end
		 
		//For all Other Types. Use figure 3.2 to help you out. 
		//Feel free to reuse any of the paramters defined aove.
		//Not sure about this part 
		else if (aluop == lwsw)
      begin
			select <= ALUadd;
		end
		
		else if (aluop == Itype)
      begin		
		   select <= ALUsub;
		end
		
		else if (aluop == unknown)
	    begin	
   		select <= ALUx;
		end
		// Redundant for completness
		else
		 begin
			select <= select;			
	    end	
	end
	
endmodule

