module stripe(
	      input 		clk_2f, //Reloj 2f
	      input [31:0] 	dataIn,
	      input 		validIn,
	      input 		reset,

	      output reg [31:0] lane0,
	      output reg [31:0] lane1,
	      output reg 	valid0,
	      output reg 	valid1
	      );
   //Definimos valores inicales en cero
   reg [31:0] 		 valoresL0 = 32'b0;
   reg [31:0] 		 valoresL1 = 32'b0;
   reg 			 valorV0 = 0;
   reg 			 valorV1 = 0;
   reg 			 valorV = 0;
   //Creamos algunas variables utiles
   reg 			 selector;
   reg 			 valorS;
   reg [31:0] 		 temp;
   

   // Iniciamos con la logica del circuito
   always @ (posedge clk_2f) begin
      valorL0 <= lane0;
      valorL1 <= lane1;
      valorV0 <= valid0;
      valorV1 <= valid1;
      valorV <= validIn;
      valorS <= selector;
   end

   always @ (*) begin
      lane0 = valorL0;
      lane1 = valorL1;
      valid0 = valorV0;
      valid1 = valorV1;
      selector = valorS;
      //Revisamos la condicion de Reset
      if (reset) begin
	 valid0 = 0;
	 valid1 = 0;
	 selector = 0;
      end else begin
	 if (~valorV) begin
	    if (validIn) begin
	       valid0 = 1;
	       valid1 = 0;
	       selector = 1;
	    end else begin
	       valid0 = 0;
	       valid1 = 0;
	    end
	 end // if (~valorV)
	 if (validIn) begin
	    if (~valorS) begin
	       lane1 = valorL1;
	       lane0= dataIn;
	       selector = 1;
	    end else begin
	       lane0 = valorL0;
	       lane1 = dataIn;
	       selector = 0;
	       valid1 = 1;
	    end
	 end // if (validIn)
	 if (valorV) begin
	    if (~validIn) begin
	       if (~selector) begin
		  valid0 = 0;
		  lane1 = valorL1;
		  selector = 0;
	       end else begin
		  valid1 = 0;
		  lane0 = valorL0;
		  selector = 0;
	       end
	    end // if (~validIn)
	 end // if (valorV)
	 if (~valid0) begin
	    lane0 = temp;
	 end
	 if (~valid1) begin
	    lane1 = temp;
	 end
      end // else: !if(reset)
   end // always @ (*)
    
endmodule // stripe
