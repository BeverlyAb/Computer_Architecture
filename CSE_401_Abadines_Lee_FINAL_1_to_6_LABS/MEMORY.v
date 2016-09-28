`timescale 1ns / 1ps
/*
Names: Beverly Abadines (004737953), Kyle Lee (005054981)
Term: Spring 2016
Class: CSE 401
Module: MEMORY.v
Lab: 4
Date: May 24th, 2016

Memory Stage: This uses the outputs of Execute Stage as well as combining the modules: and, data_memory, and mem_wb.
*/
module MEMORY(
	input	wire	[1:0]	wb_ctlout,
	input	wire		branch, memread, memwrite,
	input	wire		zero,
	input	wire	[31:0]	alu_result, rdata2out,
	input	wire	[4:0]	five_bit_muxout,
	output	wire		MEM_PCSrc, //from AND gate
	output	wire		MEM_WB_regwrite, MEM_WB_memtoreg,
	output	wire	[31:0]	read_data, mem_alu_result,
	output	wire	[4:0]	mem_write_reg
    );

	// signals
	wire	[31:0]	read_data_in;

	// instantiations
	AND AND_4(
		.membranch(branch), // excludes R-type and Beq instr. opcode	
		.zero(zero),
		.PCSrc(MEM_PCSrc)
		);
					
	data_memory data_memory4(
		.addr(alu_result),
		.write_data(rdata2out),
		.memwrite(memwrite),
		.memread(memread),
		.read_data(read_data_in)
		);
										
	mem_wb mem_wb4(
		.control_wb_in(wb_ctlout),			// inputs
		.read_data_in(read_data_in),
		.alu_result_in(alu_result),
		.write_reg_in(five_bit_muxout),
		.regwrite(MEM_WB_regwrite),			//outputs
		.memtoreg( MEM_WB_memtoreg),
		.read_data(read_data),
		.mem_alu_result(mem_alu_result),
		.mem_write_reg(mem_write_reg)
		);
	
endmodule  // MEMORY
