`timescale 1ns/ 100ps

`include "conv8_32.v"
`include "tester.v"

module testbench;
	wire reset, clk, clk_f, clk_2f, clk_4f, in8;
	wire [31:0] out_data32;
	wire [7:0] in_data8;
	wire out32;

	tester test1(/*AUTOINST*/
		     // Outputs
		     .in_data8		(in_data8[7:0]),
		     .reset		(reset),
		     .in8		(in8),
		     .clk		(clk),
		     .clk_4f		(clk_4f),
		     .clk_f		(clk_f),
		     // Inputs
		     .out32		(out32),
		     .out_data32	(out_data32[31:0]));

	conv8_32 testconv (/*AUTOINST*/
			   // Outputs
			   .out_data32		(out_data32[31:0]),
			   .out32		(out32),
			   // Inputs
			   .clk_4f		(clk_4f),
			   .clk_f		(clk_f),
			   .reset		(reset),
			   .in_data8		(in_data8[7:0]),
			   .in8			(in8));


endmodule

