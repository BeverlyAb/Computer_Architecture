`timescale 1ns / 1ps
/*
*/

module register_testbench;

	// Inputs
	reg [4:0] rs;
	reg [4:0] rt;
	reg [4:0] rd;
	reg [31:0] writedata;
	reg regwrite;

	// Outputs
	wire [31:0] A;
	wire [31:0] B;

	// Instantiate the Unit Under Test (UUT)
	register uut (
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.writedata(writedata), 
		.regwrite(regwrite), 
		.A(A), 
		.B(B)
	);/*

	module reg_test;
   wire [31:0] data_rs, data_rt;

   reg [4:0]  addr_rs, addr_rt, write_addr;
   reg [31:0] write_data;
   reg        regWrite;
*/
   initial
     begin
        rs = 0;
        rt = 1;
        regwrite = 0;

        #1 
		  rs = 2;
        rt = 3;
        rd = 3;
        writedata = 100;
        
        #1 
		  rs = 4;
        rt = 5;
        regwrite = 1;

        #1
		  regwrite = 0;
        rt = 3;

        #1 
		  rs = 6;
        regwrite = 1;
        rd = 6;
        writedata = 100;
        
        #1 $finish;
     end

  /* registerfile regfile(.data_rs_out(data_rs), .data_rt_out(data_rt),
                        .rs_in(addr_rs), .rt_in(addr_rt),
                        .write_addr_in(write_addr), .write_data_in(write_data), .regWrite_in(regWrite));
*/   
endmodule