`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.07.2020 13:35:39
// Design Name: 
// Module Name: tb_key_schedule
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


module tb_key_schedule(

    );
    reg clk;
    reg [127:0] initial_key;
    reg [31:0] r_con;
    wire [127:0] key;
    
    keyschedule uut(
        clk,
        initial_key,
        r_con,
        key
    );
    
    always begin
        clk=~clk;
        #10;
    end
    
    initial begin
        clk=1'b0;
        #20;
        initial_key=128'h2b_28_ab_09_7e_ae_f7_cf_15_d2_15_4f_16_a6_88_3c;
        r_con=32'h01_00_00_00;
        #50;
    end
    
endmodule
