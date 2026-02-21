module dit_fft ( 
    input [31:0] xn0, xn1, xn2, xn3, xn4, xn5, xn6, xn7, 
    input [31:0] xn8, xn9, xn10, xn11, xn12, xn13, xn14, xn15, 
    input [31:0] xn16, xn17, xn18, xn19, xn20, xn21, xn22, xn23, 
    input [31:0] xn24, xn25, xn26, xn27, xn28, xn29, xn30, xn31, 
    output [31:0] xk0, xk1, xk2, xk3, xk4, xk5, xk6, xk7, 
    output [31:0] xk8, xk9, xk10, xk11, xk12, xk13, xk14, xk15, 
    output [31:0] xk16, xk17, xk18, xk19, xk20, xk21, xk22, xk23, 
    output [31:0] xk24, xk25, xk26, xk27, xk28, xk29, xk30, xk31 
); 
    // Twiddle factor initialization 
    integer W_0 = 32'h0100_0000;  // 1 
    integer W_1 = 32'h00b5_ff4b;  // 0.707 - 0.707j 
    integer W_2 = 32'h0000_ff00;  // -j 
    integer W_3 = 32'hff4b_ff4b;  // -0.707 - 0.707j 
 
    wire [31:0] s10, s11, s12, s13, s14, s15, s16, s17; 
    wire [31:0] s20, s21, s22, s23, s24, s25, s26, s27; 
    wire [31:0] s30, s31, s32, s33, s34, s35, s36, s37; 
    wire [31:0] s40, s41, s42, s43, s44, s45, s46, s47; 
 
    // Stage 1: 8-point FFT computations for each chunk 
    dit_mul m1(xn0, xn4, W_0, s10, s11); 
    dit_mul m2(xn1, xn5, W_0, s12, s13); 
    dit_mul m3(xn2, xn6, W_0, s14, s15); 
    dit_mul m4(xn3, xn7, W_0, s16, s17); 
 
    dit_mul m5(xn8, xn12, W_0, s20, s21); 
    dit_mul m6(xn9, xn13, W_0, s22, s23); 
    dit_mul m7(xn10, xn14, W_0, s24, s25); 
    dit_mul m8(xn11, xn15, W_0, s26, s27); 
 
    dit_mul m9(xn16, xn20, W_0, s30, s31); 
    dit_mul m10(xn17, xn21, W_0, s32, s33); 
    dit_mul m11(xn18, xn22, W_0, s34, s35); 
    dit_mul m12(xn19, xn23, W_0, s36, s37); 
 
    dit_mul m13(xn24, xn28, W_0, s40, s41); 
    dit_mul m14(xn25, xn29, W_0, s42, s43); 
    dit_mul m15(xn26, xn30, W_0, s44, s45); 
    dit_mul m16(xn27, xn31, W_0, s46, s47); 
 
    // Stage 2: Further FFT calculations (combining the smaller FFTs) 
 
 
    // Example: Combine the results with twiddle factors for each pair 
    dit_mul m17(s10, s12, W_0, xk0, xk8); 
    dit_mul m18(s11, s13, W_1, xk1, xk9); 
    dit_mul m19(s14, s16, W_0, xk2, xk10); 
    dit_mul m20(s15, s17, W_1, xk3, xk11); 
 
    dit_mul m21(s20, s22, W_0, xk4, xk12); 
    dit_mul m22(s21, s23, W_1, xk5, xk13); 
    dit_mul m23(s24, s26, W_0, xk6, xk14); 
    dit_mul m24(s25, s27, W_1, xk7, xk15); 
 
    dit_mul m25(s30, s32, W_0, xk16, xk24); 
    dit_mul m26(s31, s33, W_1, xk17, xk25); 
    dit_mul m27(s34, s36, W_0, xk18, xk26); 
    dit_mul m28(s35, s37, W_1, xk19, xk27); 
 
    dit_mul m29(s40, s42, W_0, xk20, xk28); 
    dit_mul m30(s41, s43, W_1, xk21, xk29); 
    dit_mul m31(s44, s46, W_0, xk22, xk30); 
    dit_mul m32(s45, s47, W_1, xk23, xk31); 
 
endmodule 
 
module dit_mul ( 
    input [31:0] in_up, in_down, twiddle, 
    output [31:0] out_up, out_down 
); 
    wire [31:0] temp; 
    comp_mul mul(.a(in_down), .b(twiddle), .y(temp)); 
    comp_add add(.a(in_up), .b(temp), .y(out_up)); 
    comp_sub sub(.a(in_up), .b(temp), .y(out_down)); 
endmodule 
 
module comp_add ( 
    input [31:0] a, b, 
    output [31:0] y 
); 
    wire signed [15:0] re_A = a[31:16]; 
    wire signed [15:0] im_A = a[15:0]; 
    wire signed [15:0] re_B = b[31:16]; 
    wire signed [15:0] im_B = b[15:0]; 
    assign y = {(re_A + re_B), (im_A + im_B)};  
endmodule 
 
module comp_sub ( 
    input [31:0] a, b, 
    output [31:0] y 
); 
    wire signed [15:0] re_A = a[31:16]; 
    wire signed [15:0] im_A = a[15:0]; 
    wire signed [15:0] re_B = b[31:16]; 
    wire signed [15:0] im_B = b[15:0]; 
    assign y = {(re_A - re_B), (im_A - im_B)};  
endmodule 

 
 
module comp_mul ( 
    input [31:0] a, b, 
    output [31:0] y 
); 
    wire signed [15:0] re_A = a[31:16]; 
    wire signed [15:0] im_A = a[15:0]; 
    wire signed [15:0] re_B = b[31:16]; 
    wire signed [15:0] im_B = b[15:0]; 
    wire [31:0] ac = re_A * re_B; 
    wire [31:0] bd = im_A * im_B; 
    wire [31:0] ad = re_A * im_B; 
    wire [31:0] bc = re_B * im_A; 
    assign y = {($signed(ac[23:8])-
$signed(bd[23:8])),($signed(ad[23:8])+$signed(bc[23:8]))}; 
endmodule 
