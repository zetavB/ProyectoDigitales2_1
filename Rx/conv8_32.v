module conv8_32(
		output reg [31:0] out_data32,
		output reg 	  out32,
		input 		  clk_4f,
		input 		  clk_f,
		input 		  reset, 
		input [7:0] 	  in_data8,
		input 		  in8
		);

   reg [2:0] 			  counter = 2'b0;
   reg [7:0] 			  memory_0 = 8'b0;
   reg [15:0] 			  memory_1 = 16'b0;
   reg [23:0] 			  memory_2 = 24'b0;
   reg [31:0] 			  memory_3 = 32'b0;
   reg [31:0] 			  memory_4 = 32'b0;
   reg [31:0] 			  memory_5 = 32'b0;
   reg 				  new_fv = 0;
   reg 				  fv = 0;

   always @(posedge clk_4f)begin
      if (reset == 1)begin
	 counter <= 0;
      end else begin
	 if (in8 == 0) begin
	    if (counter == 4)begin
	       memory_0<=in_data8;
               memory_1<=0;
               memory_2<=0;
               memory_3<=0;
               memory_4<=data_recordar3;
               new_fv<=1;
	    end
	    if (counter > 0)begin
	       counter <= counter-1;
	    end else begin
	       new_fv <= 0;
	       counter <= 0;
	    end
	 end else begin // if (in8 == 0)
	    if (counter == 4) begin
	       memory_0<=in_data8;
               memory_1<=0;
               memory_2<=0;
               memory_3<=0;
               memory_4<=data_recordar3;
               counter<=3'b1;
               new_fv<=1;  
	    end else begin
	       memory_0 <= in_data8;
	       memory_1<=in_data8+256*memory_0;
	       memory_2<=in_data8+256*memory_1;
	       memory_3<=in_data8+256*memory_2;
	       
	       counter <= counter+1;
	    end
	 end	
      end // else: !if(reset == 1)
   end // always @ (posedge clk_4f)

   always @(posedge clk_f) begin
      fv <= new_fv;
      memory_5 <= memory_4;
   end

   always @(*) begin
      out_data32 = 32'b0;
      out32 = 0;
      if (reset == 1) begin
	 out32 = 0;
	 out_data32 = 32'b0;
      end else begin
	 out_data32 = memory_5;
	 out32 = fv;
      end
   end // always @ (*)

endmodule // conv8_32
