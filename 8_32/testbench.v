`timescale 1ns/ 100ps

`include "conv8_32.v"
`include "tester.v"
`include "genClock.v"

module testbench;
	wire reset, clk, clk_f, clk_2f, clk_4f, in8;
	wire [31:0] out_data32;
	wire [7:0] in_data8;
	wire out32;

	tester test1(/*AUTOINST*/
		     // Outputs
		     .clk		(clk),
		     .clk_4f		(clk_4f),
		     .clk_f		(clk_f),
		     .out_data32	(out_data32[31:0]),
		     .reset		(reset),
		     .in8		(in8),
		     // Inputs
		     .in_data8		(in_data8[7:0]),
		     .out32		(out32));

	genClock clk_gen (/*AUTOINST*/
			  // Outputs
			  .clk_f		(clk_f),
			  .clk_2f		(clk_2f),
			  .clk_4f		(clk_4f),
			  // Inputs
			  .clk			(clk),
			  .reset		(reset));

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

