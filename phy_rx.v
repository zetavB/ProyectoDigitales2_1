`include "unstripe.v"
`include "conv8_32"
`include "nombre_del_s_p_conductual"
`include "genClock.v"

module phy_rx(
    input in_data_serie_0,
    input in_data_serie_1,
    input reset, 
    input valid, 
    input clk, 
    input clk_f,
    input clk_2f, 
    input clk_4f,
    output [31:0] data_out);

    wire [31:0] w8, w9;
    wire [7:0]  w6, w7;
    wire v4, v5, v6, v7, v8, w4, w5;
    wire clk_2f_g, clk_4f_g, clk_f_g;

    

    
endmodule
