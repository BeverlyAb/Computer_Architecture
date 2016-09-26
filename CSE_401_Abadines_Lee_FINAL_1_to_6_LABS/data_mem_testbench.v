`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:01:23 05/21/2016
// Design Name:   data_memory
// Module Name:   F:/All_Computer/CSE_401/Labs/Lab4/Lab4/data_mem_testbench.v
// Project Name:  Lab4
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: data_memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module data_mem_testbench;

	// Inputs
	reg [31:0] addr;
	reg [31:0] write_data;
	reg memread;
	reg memwrite;

	// Outputs
	wire [31:0] read_data;

	// Instantiate the Unit Under Test (UUT)
	data_memory uut (
		.addr(addr), 
		.write_data(write_data), 
		.memread(memread), 
		.memwrite(memwrite), 
		.read_data(read_data)
	);
initial
     begin
        // $dumpfile("reg_test.vcd");
        // $dumpvars(0, reg_test);

        memread  = 1;
        memwrite = 0;
        addr   = 32'b00000001;

        #1
		  memread = 0;
        memwrite = 1;
        addr   = 32'b00000001;
        write_data = ~addr;

        #1 
		  memread = 1;
        memwrite = 0;
        addr   = 32'b00000010;

        #1 
		  memread = 1;
        memwrite = 1;
        addr   = 32'b00000010;
        write_data      = ~addr;

        #1 
		  memread = 1;
        memwrite = 0;
        addr   = 32'b00000100;

        #1 
		  memread = 0;
        memwrite = 1;
        addr   = 32'b00000100;
        write_data      = ~addr;
        
        #1 
		  memread = 1;
        memwrite = 0;
        addr   = 32'b00001000;

        #1 
		  memread = 1;
        memwrite = 1;
        addr   = 32'b00001000;
        write_data      = ~addr;
        
        #1 $finish;
     end
endmodule
