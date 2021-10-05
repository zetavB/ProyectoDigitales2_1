`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "cmos_cells.v"
`include "stripe.v"
`include "stripe_est.v"
`include "unstripe.v"
`include "unstripe_est.v"
`include "probadorStripes.v"

module BancoPruebasStriping; // Testbench para striping

   wire valid0, valid1, uvalid0, uvalid1, validIn,validOut, reset, ureset, valid0_est, valid1_est, uvalid0_est, uvalid1_est, validOut_est, clk_2f;
   wire [31:0] lane0, lane1, ulane0, ulane1, dataIn, dataOut, lane0_est, lane1_est, ulane0_est, ulane1_est, dataOut_est;

   // Descripcion conductual del circuito
   stripe striping(/*AUTOINST*/
		   // Outputs
		   .lane0		(lane0[31:0]),
		   .lane1		(lane1[31:0]),
		   .valid0		(valid0),
		   .valid1		(valid1),
		   // Inputs
		   .clk_2f		(clk_2f),
		   .dataIn		(dataIn[31:0]),
		   .validIn		(validIn),
		   .reset		(reset));
   unstripe unstriping(/*AUTOINST*/
		       // Outputs
		       .dataOut		(dataOut[31:0]),
		       .validOut	(validOut),
		       // Inputs
		       .clk_2f		(clk_2f),
		       .ureset		(ureset),
		       .ulane0		(ulane0[31:0]),
		       .ulane1		(ulane1[31:0]),
		       .uvalid0		(uvalid0),
		       .uvalid1		(uvalid1));
   
   // Descripcion estructural del circuito
   stripe_est striping_est(/*AUTOINST*/
			   // Outputs
			   .lane0_est		(lane0_est[31:0]),
			   .lane1_est		(lane1_est[31:0]),
			   .valid0_est		(valid0_est),
			   .valid1_est		(valid1_est),
			   // Inputs
			   .clk_2f		(clk_2f),
			   .dataIn		(dataIn[31:0]),
			   .reset		(reset),
			   .validIn		(validIn));
   unstripe_est unstriping_est(/*AUTOINST*/
			       // Outputs
			       .dataOut_est	(dataOut_est[31:0]),
			       .validOut_est	(validOut_est),
			       // Inputs
			       .clk_2f		(clk_2f),
			       .ulane0_est	(ulane0_est[31:0]),
			       .ulane1_est	(ulane1_est[31:0]),
			       .ureset		(ureset),
			       .uvalid0_est	(uvalid0_est),
			       .uvalid1_est	(uvalid1_est));

   // Probador: generador de senales y monitor
   probadorStripes probador0(/*AUTOINST*/
			     // Outputs
			     .reset		(reset),
			     .ureset		(ureset),
			     .clk_2f		(clk_2f),
			     .dataIn		(dataIn[31:0]),
			     .validIn		(validIn),
			     .lane0		(lane0[31:0]),
			     .lane1		(lane1[31:0]),
			     .ulane0		(ulane0[31:0]),
			     .ulane1		(ulane1[31:0]),
			     .valid0		(valid0),
			     .valid1		(valid1),
			     .uvalid0		(uvalid0),
			     .uvalid1		(uvalid1),
			     // Inputs
			     .dataOut		(dataOut[31:0]),
			     .validOut		(validOut),
			     .dataOut_est	(dataOut_est[31:0]),
			     .validOut_est	(validOut_est));
   
endmodule // BancoPruebas
