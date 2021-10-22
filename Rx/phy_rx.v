`include "unstripe.v"
`include "conv8_32.v"
`include "serial_parallel.v"
`include "genClock.v"

module phy_rx(
    input in_data_serie_0,
    input in_data_serie_1,
    input reset, 
    input valid, 
    input clk, 
    input clk_f,
    input clk_2f, 
    input clk_4f,
    output [31:0] dataOut);

    wire [31:0] w8, w9;
    wire [7:0]  w6, w7;
    wire v4, v5, v6, v7, v8, w4, w5;
    wire clk_2f_g, clk_4f_g, clk_f_g;

    genClock clock_generator(/*AUTOINST*/
			     // Outputs
			     .clk_f		(clk_f),
			     .clk_2f		(clk_2f),
			     .clk_4f		(clk_4f),
			     // Inputs
			     .clk		(clk),
			     .reset		(reset));

    serial_parallel s_p_0(/*AUTOINST*/
			  // Outputs
			  .parallel_data	(w6[7:0]),
			  .valid_out		(v4),
			  // Inputs
			  .clk_f		(clk_f),
			  .clk			(clk),
			  .reset		(reset),
			  .data_serial_in	(in_data_serie_0));

    serial_parallel s_p_1(/*AUTOINST*/
			  // Outputs
			  .parallel_data	(w7[7:0]),
			  .valid_out		(v5),
			  // Inputs
			  .clk_f		(clk_f),
			  .clk			(clk),
			  .reset		(reset),
			  .data_serial_in	(in_data_serie_1));

    conv8_32 conv8_32_0(/*AUTOINST*/
			// Outputs
			.out_data32	(w8[31:0]),
			.out32		(v6),
			// Inputs
			.clk_4f		(clk_4f),
			.clk_f		(clk_f),
			.reset		(reset),
			.in_data8	(w6[7:0]),
			.in8		(v4));
    
    conv8_32 conv8_32_1(/*AUTOINST*/
			// Outputs
			.out_data32	(w9[31:0]),
			.out32		(v7),
			// Inputs
			.clk_4f		(clk_4f),
			.clk_f		(clk_f),
			.reset		(reset),
			.in_data8	(w7[7:0]),
			.in8		(v5));

    unstripe unstripe_rx(/*AUTOINST*/
			 // Outputs
			 .dataOut		(dataOut[31:0]),
			 .validOut		(v8),
			 // Inputs
			 .clk_2f		(clk_2f),
			 .ureset		(reset),
			 .ulane0		(w8[31:0]),
			 .ulane1		(ulane1[31:0]),
			 .uvalid0		(v6),
			 .uvalid1		(v7));



endmodule

