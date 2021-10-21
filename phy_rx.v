`include "unstripe.v"
`include "conv8_32"
`include "nombre_del_s_p_conductual"
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
    output [31:0] data_out);

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
			  .parallel_data	(parallel_data[7:0]),
			  .valid_out		(valid_out),
			  // Inputs
			  .clk_f		(clk_f),
			  .clk			(clk),
			  .reset		(reset),
			  .data_serial_in	(data_serial_in));

    serial_parallel s_p_1(/*AUTOINST*/
			  // Outputs
			  .parallel_data	(parallel_data[7:0]),
			  .valid_out		(valid_out),
			  // Inputs
			  .clk_f		(clk_f),
			  .clk			(clk),
			  .reset		(reset),
			  .data_serial_in	(data_serial_in));

    conv8_32 8_32_0(/*AUTOINST*/
		    // Outputs
		    .out_data32		(out_data32[31:0]),
		    .out32		(out32),
		    // Inputs
		    .clk_4f		(clk_4f),
		    .clk_f		(clk_f),
		    .reset		(reset),
		    .in_data8		(in_data8[7:0]),
		    .in8		(in8));
    
    conv8_32 8_32_1(/*AUTOINST*/
		    // Outputs
		    .out_data32		(out_data32[31:0]),
		    .out32		(out32),
		    // Inputs
		    .clk_4f		(clk_4f),
		    .clk_f		(clk_f),
		    .reset		(reset),
		    .in_data8		(in_data8[7:0]),
		    .in8		(in8));

    unstripe unstripe_rx(/*AUTOINST*/
			 // Outputs
			 .dataOut		(dataOut[31:0]),
			 .validOut		(validOut),
			 // Inputs
			 .clk_2f		(clk_2f),
			 .ureset		(ureset),
			 .ulane0		(ulane0[31:0]),
			 .ulane1		(ulane1[31:0]),
			 .uvalid0		(uvalid0),
			 .uvalid1		(uvalid1));



endmodule
