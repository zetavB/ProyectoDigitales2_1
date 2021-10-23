`include "stripe.v"
`include "conv32_8.v"
`include "parallel_serial.v"
`include "unstripe.v"
`include "conv8_32.v"
`include "serial_parallel.v"
`include "genClock.v"
`include "phy_tx.v"
`include "phy_rx.v"

module phy(
	   input 	 clk, reset, validIn,
	   input [31:0]  data_in_flops,
	   output [31:0] dataOut,
	   output 	 validOut
	   );

   wire 		 clk_f, clk_2f, clk_4f;
   
   phy_tx transmi(/*AUTOINST*/
		  // Outputs
		  .out_tx_serial_0	(out_tx_serial_0),
		  .out_tx_serial_1	(out_tx_serial_1),
		  // Inputs
		  .clk			(clk),
		  .clk_f		(clk_f),
		  .clk_2f		(clk_2f),
		  .clk_4f		(clk_4f),
		  .data_in_flops	(data_in_flops[31:0]),
		  .validIn		(validIn),
		  .reset		(reset));

   phy_rx reci(/*AUTOINST*/
	       // Outputs
	       .dataOut			(dataOut[31:0]),
	       .validOut		(validOut),
	       // Inputs
	       .in_data_serie_0		(out_tx_serial_0),
	       .in_data_serie_1		(out_tx_serial_1),
	       .reset			(reset),
	       .valid			(valid),
	       .clk			(clk),
	       .clk_f			(clk_f),
	       .clk_2f			(clk_2f),
	       .clk_4f			(clk_4f));
   
   genClock reloj(/*AUTOINST*/
		  // Outputs
		  .clk_f		(clk_f),
		  .clk_2f		(clk_2f),
		  .clk_4f		(clk_4f),
		  // Inputs
		  .clk			(clk),
		  .reset		(reset));
   
endmodule // phy
