`timescale 1ns/100ps

`include "phy_rx.v"
`include "tester_rx.v"
`include "cmos_cells.v"
`include "sintesis.v"

module testbench_rx;
    wire clk, reset, enable, valid, clk_f, clk_2f, clk_4f; 
    wire in_data_serie_0, in_data_serie_1;
    wire [31:0] data_out;

   genClock generador(/*AUTOINST*/
		      // Outputs
		      .clk_f		(clk_f),
		      .clk_2f		(clk_2f),
		      .clk_4f		(clk_4f),
		      // Inputs
		      .clk		(clk),
		      .reset		(reset));

   tester_rx test_rx(
		     .clk(clk),
		     .D_0(in_data_serie_0),
		     .D_1(in_data_serie_1),
		     .enable(valid),
		     .reset(reset)
		     );

    phy_rx phy_rx_test(
		       .in_data_serie_0(in_data_serie_0),
		       .in_data_serie_1(in_data_serie_1),
		       .reset(reset),
		       .valid(valid),
		       .clk(clk),
		       .clk_f(clk_f),
		       .clk_2f(clk_2f),
		       .clk_4f(clk_4f),
		       .dataOut(data_out[31:0])
		       );
/* -----\/----- EXCLUDED -----\/-----

    sintesis test1(/-*AUTOINST*-/
		   // Outputs
		   .dataOut		(dataOut[31:0]),
		   .validOut		(validOut),
		   // Inputs
		   .clk			(clk),
		   .clk_2f		(clk_2f),
		   .clk_4f		(clk_4f),
		   .clk_f		(clk_f),
		   .in_data_serie_0	(in_data_serie_0),
		   .in_data_serie_1	(in_data_serie_1),
		   .reset		(reset),
		   .valid		(valid));
 -----/\----- EXCLUDED -----/\----- */

endmodule // testbench_rx
