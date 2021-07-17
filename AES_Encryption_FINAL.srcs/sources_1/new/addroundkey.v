`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2020 11:53:32
// Design Name: 
// Module Name: addroundkey
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


module addroundkey(
    input [127:0] in,
    input [127:0] key,
    input clk,
    output [127:0] out
    );
    assign out= in ^ key;
    /*always @(posedge clk) begin
        out <= in ^ key;
    end*/
endmodule
