`timescale 1ns/100ps

`include "phy_rx.v"
`include "tester_rx.v"
`include "cmos_cells.v"
`include "sintesis.v"

module testbench_rx;
    wire clk, reset, enable, valid; 
    wire in_data_serie_0, in_data_serie_1;
    wire [31:0] data_out;

    tester_rx test_rx(/*AUTOINST*/);

    phy_rx phy_rx_test(/*AUTOINST*/)

    sintesis test1(/*AUTOINST*/)