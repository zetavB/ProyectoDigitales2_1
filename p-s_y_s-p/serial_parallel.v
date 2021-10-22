module serial_parallel(
	input clk_f, 
    input clk, 
    input reset, 
    input data_serial_in,
	output reg [7:0] parallel_data,
	output reg valid_out
);

reg active;
reg [2:0] counter;
reg [7:0] data_bus;
reg [7:0] ff_data_bus;
reg ff_data_in;
reg [7:0] BC_counter;

always @(*) begin
    data_bus = ff_data_bus;
    if (reset) begin
        data_bus = 0;
    end
    else begin
        data_bus[counter] = ff_data_in;
    end
end

always @(clk) begin
    ff_data_bus <= data_bus;
    ff_data_in <= data_serial_in;
    if (reset) begin
        counter <= 3'b111;
        BC_counter <= 0;
        active <= 0;
    end    
    else begin
        counter <= counter+1;
    end
end

always @(clk_f) begin
    if (reset) begin
        parallel_data <= 0;
        valid_out <= 0;
    end
    else begin
        // Cuenta la cantida de hex(BC)
        if (parallel_data == 8'hBC) begin
            BC_counter <= BC_counter+1;
        end

        // Revisar la cant. de BC_counter para levantar active
        if (BC_counter > 3) begin
            active <= 1;
        end
        else begin
            active <= 0;
        end

        // Revisar si el dato es valido
        if (active && data_bus != 8'hBC) begin
            valid_out <= 1;
        end
        else begin
            valid_out <= 0;
        end

        // Dato de salida
        if (~active && ~reset) begin
            parallel_data <= 8'hBC;
        end
        else begin
            parallel_data <= data_bus;
        end
    end
end

endmodule
