`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.08.2020 10:56:51
// Design Name: 
// Module Name: tb_main
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


module tb_main(

    );
    reg tb_clk; 
    reg tb_rst;
    reg [127:0] tb_anahtar;
    reg [127:0] tb_blok;
    reg tb_g_gecerli;
    
    wire tb_hazir;
    wire [127:0] tb_sifre;
    wire tb_c_gecerli;
    
    aes_main_module uut(
        tb_clk,
        tb_rst,
        tb_anahtar,
        tb_blok,
        tb_g_gecerli,
       
        tb_hazir,
        tb_sifre,
        tb_c_gecerli
    );
    
    always begin
        tb_clk=~tb_clk;
        #10;
    end
    
    initial begin
        tb_clk=1'b0;
        
        tb_rst=1'b0;
        tb_anahtar=128'h2b_28_ab_09_7e_ae_f7_cf_15_d2_15_4f_16_a6_88_3c;
        tb_blok=128'h32_88_31_e0_43_5a_31_37_f6_30_98_07_a8_8d_a2_34;
        tb_g_gecerli=1'b1;
        
        //#10;
        
        //tb_rst=1'b1;
        //#10;
        //tb_rst=1'b0;
        /*#10;
        tb_anahtar=128'h2a_27_af_d9_72_a3_f5_c3_18_d2_15_4a_17_a9_28_3d;
        tb_blok=128'h3d_8a_35_e3_48_5f_32_37_f1_70_89_35_a1_8c_a4_30;
        tb_g_gecerli=1'b1;*/
        
        /*tb_rst=1'b0;
        tb_anahtar=128'h2a_27_af_d9_72_a3_f5_c3_18_d2_15_4a_17_a9_28_3d;
        tb_blok=128'h3d_8a_35_e3_48_5f_32_37_f1_70_89_35_a1_8c_a4_30;
        tb_g_gecerli=1'b1;*/
        
    end
endmodule
