module conv32_8(
		output reg [7:0] out_data8,
		output reg 	 out8,
		input 		 clk_4f,
		input 		 clk_f,
		input 		 reset,
		input [31:0] 	 in_data32,
		input 		 in32);


   reg [1:0] 			 contador=2'b0;
   
   always @(posedge clk_4f) begin
      if(reset==1||in32==0) begin
	 contador<=0;
      end else begin 
	 contador<=contador+1;
      end
   end

   always @(*) begin
      out_data8=8'b0;
      out8=0;
      if (in32==0||reset==1) begin
	 out8=0;
	 out_data8=8'b0;
      end else if (contador==0) begin
	 out_data8=in_data32[31:24];
	 out8=1;
      end else if (contador==1) begin
	 out_data8=in_data32[23:16];
	 out8=1;
      end else if (contador==2) begin
	 out_data8=in_data32[15:8];
	 out8=1;
      end else if (contador==3) begin
	 out_data8=in_data32[7:0];
	 out8=1;
      end
   end

endmodule // conv32_8