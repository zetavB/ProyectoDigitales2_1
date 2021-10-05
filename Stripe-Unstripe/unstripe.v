module unstripe(
		input 		  clk_2f, //Reloj 2f
		input 		  ureset,
		input [31:0] 	  ulane0,
		input [31:0] 	  ulane1,
		input 		  uvalid0,
		input 		  uvalid1,
		
		output reg [31:0] dataOut,
		output reg 	  validOut
		);
   //Definimos algunas variables utiles
   reg [31:0] 			  salidaMux;
   reg [1:0] 			  selector;
   reg 				  valid;

   //Iniciamos la logica del mux
   always @(posedge clk_2f) begin
      if (ureset == 1) begin
	 selector <= 'b00;
      end else begin
	 if (uvalid1 == 1) begin
	    valid <= uvalid1;
	    if (selector == 'b01) begin
	       salidaMux <= ulane1;
	       selector <= selector + 1;
	    end
	    if (selector == 'b11) begin
	       salidaMux <= ulane1;
	       selector <= selector + 1;
	    end else begin
	       valid <= uvalid1;
	       selector <= selector + 1;
	    end
	 end // if (uvalid1 == 1)
	 if (uvalid0 == 1) begin
	    valid <= uvalid0;
	    if (selector == 'b00) begin
	       salidaMux <= ulane0;
	       selector <= selector + 1;
	    end
	    if (selector == 'b10) begin
	       salidaMux <= ulane0;
	       selector <= selector +1;
	    end
	 end else begin // if (uvalid0 == 1)
	    salidaMux <= 'b0;
	    valid <= 'b0;
	    selector <= 0;
	 end // else: !if(uvalid0 == 1)
      end // else: !if(ureset == 1)
   end // always @ (posedge clk_2f)

   //Despues de unstripe, pasamos los resultados a la salida
   always @ (posedge clk_2f) begin
      dataOut <= salidaMux;
      validOut <= valid;
   end
   
endmodule // unstripe
