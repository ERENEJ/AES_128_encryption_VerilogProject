`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.08.2020 10:06:32
// Design Name: 
// Module Name: mixcolumns
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


module mixcolumns(
    input clk,
    input [127:0]data,
    output reg[127:0]mixed_data
    );
    


always@(posedge clk) begin
    mixed_data[127:120] <= (data[127] ? ((data[127:120]<<1)^(8'b0001_1011)) : (data[127:120]<<1)) ^ (data[63:56]) ^ (data[31:24]) ^ (data[95] ? ((data[95:88]<<1)^(8'b0001_1011)^data[95:88]) : ((data[95:88]<<1)^data[95:88]));
    mixed_data[119:112] <= (data[119] ? ((data[119:112]<<1)^(8'b0001_1011)) : (data[119:112]<<1)) ^ (data[55:48]) ^ (data[23:16]) ^ (data[87] ? ((data[87:80]<<1)^(8'b0001_1011)^data[87:80]) : ((data[87:80]<<1)^data[87:80]));
    mixed_data[111:104] <= (data[111] ? ((data[111:104]<<1)^(8'b0001_1011)) : (data[111:104]<<1)) ^ (data[47:40]) ^ (data[15:8]) ^ (data[79] ? ((data[79:72]<<1)^(8'b0001_1011)^data[79:72]) : ((data[79:72]<<1)^data[79:72]));
    mixed_data[103:96] <= (data[103] ? ((data[103:96]<<1)^(8'b0001_1011)) : (data[103:96]<<1)) ^ (data[39:32]) ^ (data[7:0]) ^ (data[71] ? ((data[71:64]<<1)^(8'b0001_1011)^data[71:64]) : ((data[71:64]<<1)^data[71:64]));
    
    mixed_data[95:88] <= data[127:120] ^ (data[95] ? ((data[95:88]<<1)^(8'b0001_1011)) : (data[95:88]<<1)) ^ (data[63] ? ((data[63:56]<<1)^(8'b0001_1011)^data[63:56]) : ((data[63:56]<<1)^data[63:56]))^data[31:24];
    mixed_data[87:80] <= data[119:112] ^ (data[87] ? ((data[87:80]<<1)^(8'b0001_1011)) : (data[87:80]<<1)) ^ (data[55] ? ((data[55:48]<<1)^(8'b0001_1011)^data[55:48]) : ((data[55:48]<<1)^data[55:48]))^data[23:16];
    mixed_data[79:72] <= data[111:104] ^ (data[79] ? ((data[79:72]<<1)^(8'b0001_1011)) : (data[79:72]<<1)) ^ (data[47] ? ((data[47:40]<<1)^(8'b0001_1011)^data[47:40]) : ((data[47:40]<<1)^data[47:40]))^data[15:8];
    mixed_data[71:64] <= data[103:96] ^ (data[71] ? ((data[71:64]<<1)^(8'b0001_1011)) : (data[71:64]<<1)) ^ (data[39] ? ((data[39:32]<<1)^(8'b0001_1011)^data[39:32]) : ((data[39:32]<<1)^data[39:32]))^data[7:0];
    
    mixed_data[63:56] <= data[127:120] ^ data[95:88] ^ (data[63] ? ((data[63:56]<<1)^(8'b0001_1011)) : (data[63:56]<<1)) ^ (data[31] ? (data[31:24] ^ (data[31:24]<<1))^(8'b0001_1011):(data[31:24] ^ (data[31:24]<<1)));
    mixed_data[55:48] <= data[119:112] ^ data[87:80] ^ (data[55] ? ((data[55:48]<<1)^(8'b0001_1011)) : (data[55:48]<<1)) ^ (data[23] ? (data[23:16] ^ (data[23:16]<<1))^(8'b0001_1011):(data[23:16] ^ (data[23:16]<<1)));
    mixed_data[47:40] <= data[111:104] ^ data[79:72] ^ (data[47] ? ((data[47:40]<<1)^(8'b0001_1011)) : (data[47:40]<<1)) ^ (data[15] ? (data[15:8] ^ (data[15:8]<<1))^(8'b0001_1011):(data[15:8] ^ (data[15:8]<<1)));
    mixed_data[39:32] <= data[103:96] ^ data[71:64] ^ (data[39] ? ((data[39:32]<<1)^(8'b0001_1011)) : (data[39:32]<<1)) ^ (data[7] ? (data[7:0] ^ (data[7:0]<<1))^(8'b0001_1011):(data[7:0] ^ (data[7:0]<<1)));
    
    mixed_data[31:24] <= (data[127] ? ((data[127:120]<<1)^data[127:120]^(8'b0001_1011)):((data[127:120]<<1)^data[127:120])) ^ data[95:88] ^ data[63:56] ^ (data[31] ? (data[31:24]<<1)^(8'b0001_1011):(data[31:24]<<1));
    mixed_data[23:16] <= (data[119] ? ((data[119:112]<<1)^data[119:112]^(8'b0001_1011)):((data[119:112]<<1)^data[119:112])) ^ data[87:80] ^ data[55:48] ^ (data[23] ? (data[23:16]<<1)^(8'b0001_1011):(data[23:16]<<1));
    mixed_data[15:8] <= (data[111] ? ((data[111:104]<<1)^data[111:104]^(8'b0001_1011)):((data[111:104]<<1)^data[111:104])) ^ data[79:72] ^ data[47:40] ^ (data[15] ? (data[15:8]<<1)^(8'b0001_1011):(data[15:8]<<1));
    mixed_data[7:0] <= (data[103] ? ((data[103:96]<<1)^data[103:96]^(8'b0001_1011)):((data[103:96]<<1)^data[103:96])) ^ data[71:64] ^ data[39:32] ^ (data[7] ? (data[7:0]<<1)^(8'b0001_1011):(data[7:0]<<1));
end

endmodule