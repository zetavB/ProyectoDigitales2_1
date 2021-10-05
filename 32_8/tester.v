module tester(
	input [7:0] 	  out_data8,
	input [7:0] 	  out_data8_est,
	input 		  out8,
	input 		  out8_est,
	output reg 	  clk,clk_4f,clk_f,
	output reg [31:0] in_data32,
	output reg 	  reset,
	output reg 	  in32);
	
initial begin
		$dumpfile("32_8.vcd");	
		$dumpvars;
		in32 <= 0; //valor inicial para in
		in_data32 <= 32'b0; //valor inicial para la entrada
		reset <= 'h0;
		//enb <= 'h0;
		@(posedge clk_f);
		reset <= 'h1;
		//enb <= 'h1;
		in32 <= 1;
		@(posedge clk_f);
		reset <= 'h0;
		//enb <= 'h1;
		@(posedge clk_f);
		in_data32 <= 32'hFFFFFFFF;
		@(posedge clk_f);
		in_data32 <= 32'hDDDDDDDD;
		@(posedge clk_f);
		in_data32 <= 32'h00000003;
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		@(posedge clk_f);
		$finish;
	end
	
	initial	clk <= 0; 
	always	#1 clk 	<= ~clk; //toggle cada 1ns
	
	initial	clk_f <= 0; 
	always	#128 clk_f 	<= ~clk_f; //toggle cada 128ns
	
	initial	clk_4f <= 0; 
	always	#32 clk_4f 	<= ~clk_4f; //toggle cada 32ns
	
	
endmodule
