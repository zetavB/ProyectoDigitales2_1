`timescale 1ns/1ps

module genClock(input clk,
		input 	   reset,
		output reg clk_f,
		output reg clk_2f,
		output reg clk_4f
		);

  always @ (posedge clk) begin
    if (reset==1) begin        
      clk_f <= 1'h0; //reseteando clk
      clk_2f <= 1'h0; //reseteando clk
      clk_4f <= 1'h0; //reseteando clk           
    end else begin         //cambia de alto a bajo o de bajo a alto    
       clk_4f <= ~clk_4f;               
       if (~clk_4f) begin
          clk_2f <= ~clk_2f;
       end
       if (~clk_2f & ~clk_4f) begin 
            clk_f <= ~clk_f;
       end
    end // else: !if(reset==1)
  end // always @ (posedge clk)
   
endmodule // genClock
