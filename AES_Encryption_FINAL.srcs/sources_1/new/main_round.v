`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2020 10:19:08
// Design Name: 
// Module Name: main_round
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module main_round(
    input [127:0] data,
    input clk,
    input [127:0] key,
    output [127:0] encrypted_data
    );
    wire [127:0] data_after_subbytes;
    wire [127:0] data_after_mixcolumns;
    
    subbytes sb1(
        clk,
        data,
        data_after_subbytes
    );
    mixcolumns mc1(
        clk,
        data_after_subbytes,
        data_after_mixcolumns
    );
    addroundkey ak1(
        data_after_mixcolumns,
        key,
        clk,
        encrypted_data
    );
endmodule
