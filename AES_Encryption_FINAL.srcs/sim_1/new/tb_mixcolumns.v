`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2020 10:07:45
// Design Name: 
// Module Name: tb_mixcolumns
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


module tb_mixcolumns(

    );
    reg tb_clk;
    reg [127:0] tb_data;
    wire [127:0] tb_mixed_data;
    
    mixcolumns uut(
        tb_clk,
        tb_data,
        tb_mixed_data
    );
    always begin
        tb_clk=~tb_clk;
        #10;
    end
    
    initial begin
        tb_clk=1'b0;
        tb_data=128'hd4_e0_b8_1e_bf_b4_41_27_5d_52_11_98_30_ae_f1_e5;
    end
endmodule
