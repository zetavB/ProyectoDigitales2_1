`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precision
// includes de archivos de verilog

`include "phy_tx.v"
`include "phy_tx_est.v"
`include "genClock.v"
`include "probadorTx.v"

module BancoPruebaTx; // Testbench para Tx

   wire clk_f, clk_2f, clk_4f, clk, reset, validIn, out_tx_serial_0, out_tx_serial_1;
   wire [31:0] data_in_flops;

   // Generador Relojes
   genClock generador(/*AUTOINST*/
		      // Outputs
		      .clk_f		(clk_f),
		      .clk_2f		(clk_2f),
		      .clk_4f		(clk_4f),
		      // Inputs
		      .clk		(clk),
		      .reset		(reset));
   
   // Descripcion conductual del circuito
   phy_tx transmision(/*AUTOINST*/
		      // Outputs
		      .out_tx_serial_0	(out_tx_serial_0),
		      .out_tx_serial_1	(out_tx_serial_1),
		      // Inputs
		      .clk		(clk),
		      .clk_f		(clk_f),
		      .clk_2f		(clk_2f),
		      .clk_4f		(clk_4f),
		      .data_in_flops	(data_in_flops[31:0]),
		      .validIn		(validIn)
		      //.reset		(reset)
		      );
   
   // Probador: generador de senales y monitor
   probadorTx tester(/*AUTOINST*/
		     // Outputs
		     .reset		(reset),
		     .clk		(clk),
		     .data_in_flops	(data_in_flops[31:0]),
		     .validIn		(validIn),
		     // Inputs
		     .out_tx_serial_0	(out_tx_serial_0),
		     .out_tx_serial_1	(out_tx_serial_1));
   // Descripcion Estructural

   phy_tx_est estructural(/*AUTOINST*/
			  // Outputs
			  .out_tx_serial_0_est	(out_tx_serial_0_est),
			  .out_tx_serial_1_est	(out_tx_serial_1_est),
			  // Inputs
			  .clk			(clk),
			  .clk_2f		(clk_2f),
			  .clk_4f		(clk_4f),
			  .clk_f		(clk_f),
			  .data_in_flops	(data_in_flops[31:0]),
			  .reset		(reset),
			  .validIn		(validIn));
   
endmodule // BancoPruebas
