module conv32_8(
		output reg [7:0] out_data,
		output reg 	 out,
		input 		 clk_4f,
		input 		 clk_f,
		input 		 reset,
		input [31:0] 	 in_data,
		input 		 in
		);


   reg [1:0] 			 contador=2'b0;
   
   always @(posedge clk_4f) begin
      if(reset==1||in==0) begin
	 contador<=0;
      end else begin 
	 contador<=contador+1;
      end
   end

   always @(*) begin
      out_data=8'b0;
      out=0;
      if (in==0||reset==1) begin
	 out=0;
	 out_data=8'b0;
      end else if (contador==0) begin
	 out_data=in_data[31:24];
	 out=1;
      end else if (contador==1) begin
	 out_data=in_data[23:16];
	 out=1;
      end else if (contador==2) begin
	 out_data=in_data[15:8];
	 out=1;
      end else if (contador==3) begin
	 out_data=in_data[7:0];
	 out=1;
      end
   end

endmodule // conv32_8
