module probadorPhy(
		input [31:0] 	  dataOut,
		input 		  validOut,
		input [31:0] 	  dataOut_est,
		input 		  validOut_est,
		output reg 	  reset,
		output reg 	  clk_2f,
		output reg [31:0] dataIn,
		output reg 	  validIn	  
		); 

	initial begin
	   $dumpfile("phyTest");	// Nombre de archivo del "dump"
	   $dumpvars;			// Directiva para "dumpear" variables
	   {reset} = 'b0; 	// A todos los bits, asigna un tipo bit con valor 0.
	   
	   repeat (1600) begin		//
              @(posedge clk_2f);	// Espera/sincroniza con el flanco positivo del reloj
	      dataIn <= dataIn - 1;
	   end
	   @(posedge clk_2f);	
	   {reset} <= 'b0;	// Asigna un tipo bit con valor 0, de tamano N
	   $finish;			// Termina de almacenar senales
	end // initial begin

	// Reloj
   initial	clk_2f 	<= 0;			// Valor inicial al reloj, sino siempre sera indeterminado
   initial reset <= 1;
   initial	validIn <= 0;
   initial      dataIn  <= {32{1'b1}};         // Asigna un valor inicial de solo unos a dataIn, para pruebas         
   
   
   always #100  clk_2f 	<= ~clk_2f;
   always #50 validIn <= 1;
   always #150 reset <= 0;
   
   
endmodule // probadorStripes

