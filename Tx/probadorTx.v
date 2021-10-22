module probadorTx(
		  input 	    out_tx_serial_0,
		  input 	    out_tx_serial_1,
		  output reg 	    reset,
		  output reg 	    clk,
		  output reg [31:0] data_in_flops,
		  output reg 	    validIn	  
		); 

	initial begin
	   $dumpfile("TxTest");	// Nombre de archivo del "dump"
	   $dumpvars;			// Directiva para "dumpear" variables
	   {reset} = 'b0; 	// A todos los bits, asigna un tipo bit con valor 0.
	   repeat (5) begin
	      @(posedge clk);
	   end
	   validIn <= 1;
	   repeat (1600) begin		//
              @(posedge clk);	// Espera/sincroniza con el flanco positivo del reloj
	      data_in_flops <= data_in_flops - 1;
	   end
	   @(posedge clk);	
	   {reset} <= 'b0;	// Asigna un tipo bit con valor 0, de tamano N
	   $finish;			// Termina de almacenar senales
	end // initial begin

	// Reloj
   initial	clk 	<= 0;			// Valor inicial al reloj, sino siempre sera indeterminado
   initial	validIn <= 0;
   initial      reset <= 1;
   initial      data_in_flops  <= {32{1'b1}};      
   
   
   always #100  clk 	<= ~clk;
   always #200 reset <= 0;
   
endmodule // probadorTx


