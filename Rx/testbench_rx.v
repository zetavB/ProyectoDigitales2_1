`timescale 1ns/100ps

`include "phy_rx.v"
`include "tester_rx.v"
`include "cmos_cells.v"
`include "sintesis.v"

module testbench_rx;
    wire clk, reset, enable, valid; 
    wire in_data_serie_0, in_data_serie_1;
    wire [31:0] data_out;

   tester_rx test_rx(
        .clk(clk),
        .D_0(in_data_serie_0),
        .D_0(in_data_serie_1),
        .clk_2f(clk_2f),
		.clk_4f(clk_4f),
		.clk_f(clk_f),
        .enable(valid),
        .reset(reset),

    );

    phy_rx phy_rx_test(
        .in_data_serie_0(in_data_serie_0),
        .in_data_serie_1(in_data_serie_1),
        .reset(reset),
        .valid(valid),
        .clk(clk),
        .clk_f(clk_f),
		.clk_2f(clk_2f),
		.clk_4f(clk_4f),
        .dataOut(data_out[31:0]),
    );

    sintesis test1(/*AUTOINST*/
        .out_data32(data_out[31:0]),
        .clk(clk),
        .clk_2f(clk_2f),
		.clk_4f(clk_4f),
		.clk_f(clk_f),
        .in_data_serie_0(in_data_serie_0),
		.in_data_serie_1(in_data_serie_1),
		.reset(reset),
		.valid(valid)
    
    );