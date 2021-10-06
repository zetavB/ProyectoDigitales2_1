`timescale 1ns/ 100ps

`include "genClock.v"
`include "genClock_est.v"
`include "cmos_cells.v"
`include "tester.v"

module testbench;
	wire reset, clk, clk_f, clk_2f, clk_4f;

   tester test(/*AUTOINST*/
	       // Outputs
	       .clk			(clk),
	       .reset			(reset),
	       // Inputs
	       .clk_f			(clk_f),
	       .clk_2f			(clk_2f),
	       .clk_4f			(clk_4f));

   genClock reloj_cond(/*AUTOINST*/
		       // Outputs
		       .clk_f		(clk_f),
		       .clk_2f		(clk_2f),
		       .clk_4f		(clk_4f),
		       // Inputs
		       .clk		(clk),
		       .reset		(reset));
   genClock_est reloj_est(/*AUTOINST*/
			  // Outputs
			  .clk_2f_est		(clk_2f_est),
			  .clk_4f_est		(clk_4f_est),
			  .clk_f_est		(clk_f_est),
			  // Inputs
			  .clk			(clk),
			  .reset		(reset));
   
   
endmodule
