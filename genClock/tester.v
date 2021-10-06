module tester(
	      input 		clk_f,
	      input 		clk_2f,
	      input 		clk_4f,
	      output reg 	clk,
	      output reg 	reset
	      );
	
initial begin
		$dumpfile("genClock.vcd");	
		$dumpvars;
		reset <= 'h0;
		@(posedge clk);
		reset <= 'h1;
		@(posedge clk);
		reset <= 'h0;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
                clk <= 0;
		$finish;
	end
	
	initial	clk <= 0; 
	always	#1 clk 	<= ~clk; //toggle cada 1ns
	
endmodule // tester
