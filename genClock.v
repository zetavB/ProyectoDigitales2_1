`timescale 1ns/1ps

module genClock(input clk,
            input reset,
            output reg clk_ff,
            output reg clk_2ff,
            output reg clk_3ff);

  always @ (posedge clk) begin
    if (reset==1) begin        
      clk_ff <= 1'h0; //reseteando clk
      clk_2ff <= 1'h0; //reseteando clk
      clk_3ff <= 1'h0; //reseteando clk           
    end 
    else begin         //cambia de alto a bajo o de bajo a alto                             
          clk_3ff <= ~clk_3ff;               
          if (~clk_3ff) 
            clk_2ff <= ~clk_2ff;
          if (~clk_2ff & ~clk_3ff) 
            clk_ff <= ~clk_ff;
    end
  end		
		);
endmodule // genClock
