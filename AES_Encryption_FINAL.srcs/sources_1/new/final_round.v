`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2020 12:54:58
// Design Name: 
// Module Name: final_round
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


module final_round(
    input [127:0] data,
    input clk,
    input [127:0] key,
    output [127:0] encrypted_data
    );
    wire [127:0] data_after_subbytes;
   
    subbytes sb1(
        clk,
        data,
        data_after_subbytes
    );
    addroundkey ak1(
        data_after_subbytes,
        key,
        clk,
        encrypted_data
    );
endmodule
