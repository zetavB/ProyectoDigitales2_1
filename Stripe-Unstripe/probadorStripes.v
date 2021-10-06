module probadorStripes(
		input [31:0] 	  dataOut,
		input 		  validOut,
		input [31:0] 	  dataOut_est,
		input 		  validOut_est,
		output reg 	  reset,
		output reg 	  ureset,
		output reg 	  clk_2f,
		output reg [31:0] dataIn,
		output reg 	  validIn,
		output reg [31:0] lane0,
		output reg [31:0] lane1,
		output reg [31:0] ulane0,
		output reg [31:0] ulane1, 
 		output reg 	  valid0,
		output reg 	  valid1,
		output reg 	  uvalid0,
		output reg 	  uvalid1 	  
		); 

	initial begin
	   $dumpfile("stripingTest");	// Nombre de archivo del "dump"
	   $dumpvars;			// Directiva para "dumpear" variables
	   {reset} = 'b0; 	// A todos los bits, asigna un tipo bit con valor 0.
	   repeat (5) begin
	      @(posedge clk_2f);
	   end
	   validIn <= 1;
	   repeat (1600) begin		//
              @(posedge clk_2f);	// Espera/sincroniza con el flanco positivo del reloj
	      dataIn <= dataIn - 1;
	      lane0 <= lane0 - 1;
	      lane1 <= lane1 - 1;
	      ulane0 <= ulane0 - 1;
	      ulane1 <= ulane1 - 1;
	   end
	   @(posedge clk_2f);	
	   {reset} <= 'b0;	// Asigna un tipo bit con valor 0, de tamano N
	   $finish;			// Termina de almacenar senales
	end // initial begin

	// Reloj
   initial	clk_2f 	<= 0;			// Valor inicial al reloj, sino siempre sera indeterminado
   initial	validIn <= 0;
   initial      reset <= 1;
   initial      ureset <= 1;
   initial      dataIn  <= {32{1'b1}};         // Asigna un valor inicial de solo unos a dataIn, para pruebas
   initial      lane0  <= {32{1'b1}};
   initial      lane1  <= {32{1'b1}} - 1;
   initial      ulane0  <= {32{1'b1}};
   initial      ulane1  <= {32{1'b1}} - 1;          
   
   
   always #100  clk_2f 	<= ~clk_2f;
   always #50 valid0 <= 1;
   always #50 valid1 <= 1;
   always #50 uvalid0 <= 1;
   always #50 uvalid1 <= 1;
   always #200 reset <= 0;
   always #150 ureset <= 0;
   
   
endmodule // probadorStripes

