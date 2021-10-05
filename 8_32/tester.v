module tester(
	      output reg [7:0] in_data8,
	      output reg       reset,
	      output reg       in8,
	      output reg       clk,clk_4f,clk_f,
	      input 	       out32,
	      input [31:0]     out_data32
	      );
	
initial begin
   $dumpfile("8_32.vcd");	
   $dumpvars;
   in8 <= 0; //valor inicial para in
   in_data8 <= 8'b0; //valor inicial para la entrada
   reset <= 'h0;

   @(posedge clk_4f);
   reset <= 'h1;

   in8 <= 1;
   @(posedge clk_4f);

   @(posedge clk_4f);
   in_data8 <= 8'hF;
   reset <= 'h0;
   @(posedge clk_4f);
   in_data8 <= 8'hD;
   @(posedge clk_4f);
   in_data8 <= 8'h03;
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   @(posedge clk_4f);
   $finish;
end
	
	
   initial	clk <= 0; 
   always	#1 clk 	<= ~clk; //toggle cada 1ns
   
   initial	clk_f <= 0; 
   always	#128 clk_f 	<= ~clk_f; //Hace toggle cada 128ns
   
   initial	clk_4f <= 0;
   always	#32 clk_4f 	<= ~clk_4f; //Hace toggle cada 32ns
   
   
endmodule
