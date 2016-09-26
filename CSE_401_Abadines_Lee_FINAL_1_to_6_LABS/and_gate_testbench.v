`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:04:57 05/21/2016
// Design Name:   AND
// Module Name:   F:/All_Computer/CSE_401/Labs/Lab4/Lab4/and_gate_testbench.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: AND
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module and_gate_testbench;

	// Inputs
	reg membranch;
	reg zero;

	// Outputs
	wire PCSrc;

	// Instantiate the Unit Under Test (UUT)
	AND uut (
		.membranch(membranch), 
		.zero(zero), 
		.PCSrc(PCSrc)
	);

	initial begin
		// Initialize Inputs
		membranch <= 0;
		zero <= 0;
		// PCScr should output 0
		
		#1
		membranch <= 1;
		zero <= 0;
		// PCScr outputs 0
		
		#1
		membranch <= 0;
		zero <= 1;
		// PCScr outputs 0
		
		#1
		membranch <= 1;
		zero <= 1;
		// PCScr outputs 1
	end
      
endmodule

