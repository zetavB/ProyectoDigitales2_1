module unstripe(
		input 		  clk_2f, //Reloj 2f
		input 		  reset,
		input [31:0] 	  lane0,
		input [31:0] 	  lane1,
		input 		  valid0,
		input 		  valid1,
		
		output reg [31:0] dataOut,
		output reg 	  validOut
		);
   //Definimos algunas variables utiles
   reg [31:0] 			  salidaMux;
   reg [1:0] 			  selector;
   reg 				  valid;

   //Iniciamos la logica del mux
   always @(posedge clk_2f) begin
      if (reset == 1) begin
	 selector <= 'b00;
      end else begin
	 if (valid1 == 1) begin
	    valid <= valid1;
	    if (selector == 'b01) begin
	       salidaMux <= lane1;
	       selector <= selector + 1;
	    end
	    if (selector == 'b11) begin
	       salidaMux <= lane1;
	       selector <= selector + 1;
	    end else begin
	       valid <= valid1;
	       selector <= selector + 1;
	    end
	 end // if (valid1 == 1)
	 if (valid0 == 1) begin
	    valid <= valid0;
	    if (selector == 'b00) begin
	       salidaMux <= lane0;
	       selector <= selector + 1;
	    end
	    if (selector == 'b10) begin
	       salidaMux <= lane0;
	       selector <= selector +1;
	    end
	 end else begin // if (valid0 == 1)
	    salidaMux <= 'b0;
	    valid <= 'b0;
	    selector <= 0;
	 end // else: !if(valid0 == 1)
      end // else: !if(reset == 1)
   end // always @ (posedge clk_2f)

   //Despues de unstripe, pasamos los resultados a la salida
   always @ (posedge clk_2f) begin
      dataOut <= salidaMux;
      validOut <= valid;
   end
   
endmodule // unstripe
