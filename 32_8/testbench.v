`timescale 1ns/ 100ps

`include "conv32_8.v"
`include "tester.v"

module testbench;
	wire reset, clk, clk_f, clk_4f;
	wire [31:0] in_data32;
	wire [7:0] out_data8;
	wire out8, in32;

	tester test2
		(/*AUTOINST*/
		 // Outputs
		 .clk			(clk),
		 .clk_4f		(clk_4f),
		 .clk_f			(clk_f),
		 .in_data32		(in_data32[31:0]),
		 .reset			(reset),
		 .in32			(in32),
		 // Inputs
		 .out_data8		(out_data8[7:0]),
		 .out8			(out8));

	conv32_8 coduct_328
		(/*AUTOINST*/
		 // Outputs
		 .out_data8		(out_data8[7:0]),
		 .out8			(out8),
		 // Inputs
		 .clk_4f		(clk_4f),
		 .clk_f			(clk_f),
		 .reset			(reset),
		 .in_data32		(in_data32[31:0]),
		 .in32			(in32));


endmodule
