`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2020 10:58:28
// Design Name: 
// Module Name: aes_main_module
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


module aes_main_module(
    input clk, rst,
    input [127:0] anahtar,
    input [127:0] blok,
    input g_gecerli,
    
    output hazir,
    output reg [127:0] sifre,
    output c_gecerli
    );
    wire [127:0] t_out;
    wire [127:0] round_outputs [0:8];
    wire [127:0] proper_keys [0:9];
    wire [127:0] final_result;
    reg [127:0] finput; 
    reg [127:0] fkey;
    addroundkey first_ark (
        blok,anahtar,/*finput, fkey*/clk, t_out
    );
    keyschedule k1(
        clk,
        anahtar,
        32'h01_00_00_00,
        proper_keys[0]
    );
    keyschedule k2(
        clk,
        proper_keys[0],
        32'h02_00_00_00,
        proper_keys[1]
    );
    keyschedule k3(
        clk,
        proper_keys[1],
        32'h04_00_00_00,
        proper_keys[2]
    );
    keyschedule k4(
        clk,
        proper_keys[2],
        32'h08_00_00_00,
        proper_keys[3]
    );
    keyschedule k5(
        clk,
        proper_keys[3],
        32'h10_00_00_00,
        proper_keys[4]
    );
    keyschedule k6(
        clk,
        proper_keys[4],
        32'h20_00_00_00,
        proper_keys[5]
    );
    keyschedule k7(
        clk,
        proper_keys[5],
        32'h40_00_00_00,
        proper_keys[6]
    );
    keyschedule k8(
        clk,
        proper_keys[6],
        32'h80_00_00_00,
        proper_keys[7]
    );
    keyschedule k9(
        clk,
        proper_keys[7],
        32'h1b_00_00_00,
        proper_keys[8]
    );
    keyschedule k10(
        clk,
        proper_keys[8],
        32'h36_00_00_00,
        proper_keys[9]
    );
    main_round r1(
        .data(t_out),
        .clk(clk),
        .key(proper_keys[0]),
        .encrypted_data(round_outputs[0])
    );
    main_round r2(
        .data(round_outputs[0]),
        .clk(clk),
        .key(proper_keys[1]),
        .encrypted_data(round_outputs[1])
    );
    main_round r3(
        .data(round_outputs[1]),
        .clk(clk),
        .key(proper_keys[2]),
        .encrypted_data(round_outputs[2])
    );
    main_round r4(
        .data(round_outputs[2]),
        .clk(clk),
        .key(proper_keys[3]),
        .encrypted_data(round_outputs[3])
    );
    main_round r5(
        .data(round_outputs[3]),
        .clk(clk),
        .key(proper_keys[4]),
        .encrypted_data(round_outputs[4])
    );
    main_round r6(
        .data(round_outputs[4]),
        .clk(clk),
        .key(proper_keys[5]),
        .encrypted_data(round_outputs[5])
    );
    main_round r7(
        .data(round_outputs[5]),
        .clk(clk),
        .key(proper_keys[6]),
        .encrypted_data(round_outputs[6])
    );
    main_round r8(
        .data(round_outputs[6]),
        .clk(clk),
        .key(proper_keys[7]),
        .encrypted_data(round_outputs[7])
    );
    main_round r9(
        .data(round_outputs[7]),
        .clk(clk),
        .key(proper_keys[8]),
        .encrypted_data(round_outputs[8])
    );
    final_round rfinal(
        .data(round_outputs[8]),
        .clk(clk),
        .key(proper_keys[9]),
        .encrypted_data(final_result)
    );
    reg control=1'b0;
    reg ready_control=1'b0;
    always @* begin
        if(sifre[127]===1'bX) begin
            control=1'b0;
        end
        else begin
            control=1'b1;
        end
        if(proper_keys[9]===127'bX) begin
            ready_control=1'b0;
        end
        else begin
            ready_control=1'b1;
        end
    end
    assign c_gecerli=control;
    assign hazir=ready_control;
    always @* begin
        /*if(rst) begin
            sifre=128'b0;
            control=1'b0;
            ready_control=1'b0;
        end*/
    end
    always @ (posedge clk) begin
        if(g_gecerli && hazir) begin
            finput<=blok;
            fkey<=anahtar;
        end
        if(rst) begin
            sifre<=128'b0;
            control<=1'b0;
            ready_control<=1'b0;
        end
        else begin
            sifre<=final_result;
        end
        
        /*if(c_gecerli && g_gecerli) begin
            ready_control<=1'b1;
        end
        if(hazir) begin
            finput<=blok;
            fkey<=anahtar;
            ready_control<=1'b0;
        end
        if(rst && c_gecerli) begin
            sifre<=128'b0;
            control<=1'b0;
            ready_control<=1'b0;
        end
        else begin
            sifre<=final_result;
        end*/
    end
endmodule
