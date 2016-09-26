`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: mux_testbench.v
Lab: 2
Date: May 3rd, 2016

Test the mux module. Refer to mux.v 
*/
module mux_testbench;

	// Inputs
	reg [31:0] a, b;
	reg sel;

	// Outputs
	wire [31:0] y;

	// Instantiate the Unit Under Test (UUT)
	mux uut (
		.y(y), //.UUT_var(Testbench_var), Testbench_var PASS the values into the UUT_var
		.a(a), 
		.b(b),
		.sel(sel)
	);
						//initial is typically for Testbenches
	initial begin	// Initialize Inputs, all inputs must be REGISTERS!
		a = 32'hAAAAAAAA;		// Time = 1
		b = 32'h55555555;
		sel = 1'b1;				// at Time = 1 y should be AAAAAAAA 
		#10;						// delay 10 ticks on clock, "increase time by 10 ticks"
									// Time = 11
		a = 32'h00000000;		// sel has not changed; at Time = 11 y should be = a = 00000000
		#10;						// Time = 21
		
		sel = 1'b1;				// sel = 1, same value as a 
		#10;						// Time = 31
			
		b = 32'hFFFFFFFF;		
		#5;						// Time = 36
		
		a = 32'hA5A5A5A5;		// at Time 36, y = a5a5a5a5
		#5;						// Time = 41
		
		sel = 1'b0;				// sel = 0; 
		b = 32'hDDDDDDDD;		// at Time = 41, y = DDDDDDDD, so tricky run lines, wipe data until delay
		#5;						// Time  = 46
		
		sel = 1'bx; 			// x exists in hex, and deci as well; x indicates don't care condition
	end
	
	always @(a or b or sel)
		#1 $display ("At t = %0d sel = %b a = %h b = %h y = %h",
			$time, sel, a, b, y);
endmodule 




