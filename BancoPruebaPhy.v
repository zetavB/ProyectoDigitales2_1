`timescale 	1ns				/ 100ps
// escala	unidad temporal (valor de "#1") / precision
// includes de archivos de verilog
`include "cmos_cells.v"
`include "probadorPhy.v"
`include "phy.v"

module BancoPruebasPhy; // Testbench para striping

   wire clk, reset, validIn, validOut, validOut_est;
   wire [31:0] data_in_flops, dataOut, dataOut_est;
   

   // Descripcion conductual del circuito
   phy principal(/*AUTOINST*/
		 // Outputs
		 .dataOut		(dataOut[31:0]),
		 .validOut		(validOut),
		 // Inputs
		 .clk			(clk),
		 .reset			(reset),
		 .validIn		(validIn),
		 .data_in_flops		(data_in_flops[31:0]));
   
   // Probador: generador de senales y monitor
   probadorPhy probador0(/*AUTOINST*/
			 // Outputs
			 .reset			(reset),
			 .clk_2f		(clk),
			 .dataIn		(data_in_flops[31:0]),
			 .validIn		(validIn),
			 // Inputs
			 .dataOut		(dataOut[31:0]),
			 .validOut		(validOut),
			 .dataOut_est		(dataOut_est[31:0]),
			 .validOut_est		(validOut_est));
   
endmodule // BancoPruebas
