module parallel_serial(
    input clk_f, clk, valid, reset,
    input [7:0] data_in_8b,
    output reg data_out_serial
);

reg [2:0] counter;
reg [7:0] data_bus;

always @(clk_f) begin
    if (~valid) begin
        data_bus <= 8'hBC;
    end
    else begin
        data_bus <= data_in_8b;    
    end
end

always @(clk) begin
    if (reset) begin
        counter <= 3'b111;
        data_out_serial <= 0;
    end
    else begin
        data_out_serial <= data_bus[counter];
        counter <= counter-1;
    end    
end

endmodule


