`include "cmos_cells.v"
`include "genClock.v"
`include "parallel_serial.v"
`include "serial_parallel.v"
`include "parallel_serial_est.v"
`include "serial_parallel_est.v"
`include "parallel_serial_testbench.v"

module result_testbench();

wire clk, clk_f, clk_2f,clk_4f, valid, reset, data_out_serial, valid_out;
wire [7:0] data_in_8b, parallel_data, parallel_data_est;

   genClock gen_clk(
		 .clk(clk),
		 .reset(reset),
		 .clk_f(clk_f),      //Reloj 4 veces mas lento que clk
		 .clk_2f(clk_2f),
		 .clk_4f(clk_4f)
		    );
   
   parallel_serial p_s_inst(
			 .clk_f(clk_f),      //Reloj 4 veces mas lento que clk 
			 .clk(clk), 
			 .valid(valid), 
			 .reset(reset),
			 .data_in_8b(data_in_8b),
			 .data_out_serial(data_out_serial)
			    );
   
/* -----\/----- EXCLUDED -----\/-----
   parallel_serial_est p_s_inst_est(/-*AUTOINST*-/
				    // Outputs
				    .data_out_serial	(data_out_serial),
				    // Inputs
				    .clk		(clk),
				    .clk_f		(clk_f),
				    .data_in_8b		(data_in_8b[7:0]),
				    .reset		(reset),
				    .valid		(valid));
 -----/\----- EXCLUDED -----/\----- */
   

   serial_parallel s_p_inst(
			    .clk_f(clk_f), 
			    .clk(clk), 
			    .reset(reset), 
			    .data_serial_in(data_out_serial),
			    .parallel_data(parallel_data),
			    .valid_out(valid_out)
			    );
   
   
   parallel_serial_testbench p_s_tb(
				    .clk(clk),
				    .valid(valid), 
				    .reset(reset),
				    .data_in_8b(data_in_8b),
				    .data_out_serial(data_out_serial)
				    );

endmodule // result_testbench

