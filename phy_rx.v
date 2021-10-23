module phy_rx(
    input 	  in_data_serie_0,
    input 	  in_data_serie_1,
    input 	  reset, 
    input 	  valid, 
    input 	  clk, 
    input 	  clk_f,
    input 	  clk_2f, 
    input 	  clk_4f,
    output [31:0] dataOut,
    output 	  validOut
);

   wire [31:0] 	  therTo0, therTo1;
   wire [7:0] 	  ateBit0, ateBit1;
   wire 	  valid0, valid1, valid2, valid3;

    serial_parallel s_p_0(/*AUTOINST*/
			  // Outputs
			  .parallel_data	(ateBit0[7:0]),
			  .valid_out		(valid0),
			  // Inputs
			  .clk_f		(clk_f),
			  .clk			(clk),
			  .reset		(reset),
			  .data_serial_in	(in_data_serie_0));

    serial_parallel s_p_1(/*AUTOINST*/
			  // Outputs
			  .parallel_data	(ateBit1[7:0]),
			  .valid_out		(valid1),
			  // Inputs
			  .clk_f		(clk_f),
			  .clk			(clk),
			  .reset		(reset),
			  .data_serial_in	(in_data_serie_1));

    conv8_32 conv8_32_0(/*AUTOINST*/
			// Outputs
			.out_data32	(therTo0[31:0]),
			.out32		(valid2),
			// Inputs
			.clk_4f		(clk_4f),
			.clk_f		(clk_f),
			.reset		(reset),
			.in_data8	(ateBit0[7:0]),
			.in8		(valid0));
    
    conv8_32 conv8_32_1(/*AUTOINST*/
			// Outputs
			.out_data32	(therTo1[31:0]),
			.out32		(valid3),
			// Inputs
			.clk_4f		(clk_4f),
			.clk_f		(clk_f),
			.reset		(reset),
			.in_data8	(ateBit1[7:0]),
			.in8		(valid1));

    unstripe unstripe_rx(/*AUTOINST*/
			 // Outputs
			 .dataOut		(dataOut[31:0]),
			 .validOut		(validOut),
			 // Inputs
			 .clk_2f		(clk_2f),
			 .ureset		(reset),
			 .ulane0		(therTo0[31:0]),
			 .ulane1		(therTo1[31:0]),
			 .uvalid0		(valid2),
			 .uvalid1		(valid3));
endmodule // phy_rx


