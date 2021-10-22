module parallel_serial_testbench(
    input data_out_serial, 
    output reg valid, reset, clk,
    output reg [7:0] data_in_8b
);

    initial begin

      $dumpfile("p_s_s_p.vcd");
      $dumpvars;
        reset <= 1'b1;
        valid <= 1'b0;
        data_in_8b <= 8'h23;
        @(posedge clk);
        reset <= 1'b0;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        valid <= 1;
        data_in_8b <= 8'hAA;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        data_in_8b <= 8'hAB;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);        
        
      $finish;

    end

    initial clk <= 0;
    always #2 clk <= ~clk;

endmodule