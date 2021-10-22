module phy_tx(
	input 	     clk_f, clk_2f, clk_4f,
	input [31:0] data_in_flops,
	input 	     validIn,
	input 	     reset, 
	output reg   out_tx_serial_0,
	output reg   out_tx_serial_1
	      );
   wire [31:0] 	     lane0, lane1;
   wire [7:0] 	     ateBit0, ateBit1;
   wire 	     valid0, valid1, valid2, valid3;
   
 	     
   
   stripe striping_tx(/*AUTOINST*/
		      // Outputs
		      .lane0		(lane0[31:0]),
		      .lane1		(lane1[31:0]),
		      .valid0		(valid0),
		      .valid1		(valid1),
		      // Inputs
		      .clk_2f		(clk_2f),
		      .dataIn		(data_in_flops[31:0]),
		      .validIn		(validIn),
		      .reset		(reset));
   
   conv32_8 conversion0_tx(/*AUTOINST*/
			   // Outputs
			   .out_data8		(ateBit0[7:0]),
			   .out8		(valid2),
			   // Inputs
			   .clk_4f		(clk_4f),
			   .clk_f		(clk_f),
			   .reset		(reset),
			   .in_data32		(lane0[31:0]),
			   .in32		(valid0));
   conv32_8 conversion1_tx(/*AUTOINST*/
			   // Outputs
			   .out_data8		(ateBit1[7:0]),
			   .out8		(valid3),
			   // Inputs
			   .clk_4f		(clk_4f),
			   .clk_f		(clk_f),
			   .reset		(reset),
			   .in_data32		(lane1[31:0]),
			   .in32		(valid1));
   
   parallel_serial pToS0_tx(/*AUTOINST*/
			    // Outputs
			    .data_out_serial	(data_out_serial_0),
			    // Inputs
			    .clk_f		(clk_f),
			    .clk		(clk),
			    .valid		(valid2),
			    .reset		(reset),
			    .data_in_8b		(ateBit0[7:0]));
   parallel_serial pToS1_tx(/*AUTOINST*/
			    // Outputs
			    .data_out_serial	(data_out_serial_1),
			    // Inputs
			    .clk_f		(clk_f),
			    .clk		(clk),
			    .valid		(valid3),
			    .reset		(reset),
			    .data_in_8b		(ateBit1[7:0]));
endmodule // phy_tx
