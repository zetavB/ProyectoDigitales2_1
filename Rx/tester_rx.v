module tester_rx(
    output reg clk,
    output reg clk_4f,
    output reg clk_f,
    output reg clk_2f,
    output reg D_0,
    output reg D_1,
    output reg reset,
    output reg enable);


    initial begin

        //A través del tester vamos a enviar diferentes datos al phy, para comprobar que su funcionamiento sea correcto
        //
        $dumpfile("phy_rx.vcd");
		$dumpvars;
		enable <= 'h0;
		reset <= 'h1;
		@(posedge clk);
		reset <= 'h1;
		enable <= 'h1;
		@(posedge clk);
		reset <= 'h0;
		D_0 <= 1'b1;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b1;

        //A partir de aquí se envían datos 

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;

		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;

		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		//$C
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;

        //Ahora se prueba con más datos, pero enviando inicialmente datos random
		@(posedge clk);
		D_0 <= $random;
		D_1 <= $random;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		D_0 <= 1'b0;
		D_1 <= 1'b0;
		@(posedge clk);
		D_0 <= 1'b1;
		D_1 <= 1'b1;
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		$finish;
	end

    //Vamos a crear los relojes y hacer el toggle de cada uno de ellos para las pruebas correctas.
	initial	clk <= 0;
	always	#1 clk 	<= ~clk;
	initial clk_4f <= 0;
	always #8 clk_f <= ~clk_f;
	initial clk_2f <= 0;
	always #4 clk_2f <= ~clk_2f;
	initial clk_f <= 0;
	always #2 clk_4f <= ~clk_4f;
        
    
endmodule