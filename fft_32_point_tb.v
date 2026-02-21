module tb_dit_fft; 
 
    // Inputs 
    reg [31:0] xn0, xn1, xn2, xn3, xn4, xn5, xn6, xn7; 
    reg [31:0] xn8, xn9, xn10, xn11, xn12, xn13, xn14, xn15; 
    reg [31:0] xn16, xn17, xn18, xn19, xn20, xn21, xn22, xn23; 
    reg [31:0] xn24, xn25, xn26, xn27, xn28, xn29, xn30, xn31; 
 
    // Outputs 
    wire [31:0] xk0, xk1, xk2, xk3, xk4, xk5, xk6, xk7; 
    wire [31:0] xk8, xk9, xk10, xk11, xk12, xk13, xk14, xk15; 
    wire [31:0] xk16, xk17, xk18, xk19, xk20, xk21, xk22, xk23; 
    wire [31:0] xk24, xk25, xk26, xk27, xk28, xk29, xk30, xk31; 
 
    // Instantiate the Unit Under Test (UUT) 
    dit_fft uut ( 
        .xn0(xn0), .xn1(xn1), .xn2(xn2), .xn3(xn3), .xn4(xn4), .xn5(xn5), 
        .xn6(xn6), .xn7(xn7), .xn8(xn8), .xn9(xn9), .xn10(xn10), 
.xn11(xn11), 
        .xn12(xn12), .xn13(xn13), .xn14(xn14), .xn15(xn15), .xn16(xn16), 
        .xn17(xn17), .xn18(xn18), .xn19(xn19), .xn20(xn20), .xn21(xn21), 
        .xn22(xn22), .xn23(xn23), .xn24(xn24), .xn25(xn25), .xn26(xn26), 
        .xn27(xn27), .xn28(xn28), .xn29(xn29), .xn30(xn30), .xn31(xn31), 
        .xk0(xk0), .xk1(xk1), .xk2(xk2), .xk3(xk3), .xk4(xk4), .xk5(xk5), 
        .xk6(xk6), .xk7(xk7), .xk8(xk8), .xk9(xk9), .xk10(xk10), 
.xk11(xk11), 
        .xk12(xk12), .xk13(xk13), .xk14(xk14), .xk15(xk15), .xk16(xk16), 
        .xk17(xk17), .xk18(xk18), .xk19(xk19), .xk20(xk20), .xk21(xk21), 
        .xk22(xk22), .xk23(xk23), .xk24(xk24), .xk25(xk25), .xk26(xk26), 
        .xk27(xk27), .xk28(xk28), .xk29(xk29), .xk30(xk30), .xk31(xk31) 
    ); 
 
    // Stimulus  
 
    initial begin 
        // Initialize inputs to some test values 
        xn0  = 32'h01000000; // Real part 1, Imaginary part 0 
        xn1  = 32'h02000000; // Real part 2, Imaginary part 0 
        xn2  = 32'h03000000; // Real part 3, Imaginary part 0 
        xn3  = 32'h04000000; // Real part 4, Imaginary part 0 
        xn4  = 32'h05000000; // Real part 5, Imaginary part 0 
        xn5  = 32'h06000000; // Real part 6, Imaginary part 0 
        xn6  = 32'h07000000; // Real part 7, Imaginary part 0 
        xn7  = 32'h08000000; // Real part 8, Imaginary part 0 
        xn8  = 32'h09000000; // Real part 9, Imaginary part 0 
        xn9  = 32'h0A000000; // Real part 10, Imaginary part 0 
        xn10 = 32'h0B000000; // Real part 11, Imaginary part 0 
        xn11 = 32'h0C000000; // Real part 12, Imaginary part 0 
        xn12 = 32'h0D000000; // Real part 13, Imaginary part 0 
        xn13 = 32'h0E000000; // Real part 14, Imaginary part 0 
        xn14 = 32'h0F000000; // Real part 15, Imaginary part 0 
        xn15 = 32'h10000000; // Real part 16, Imaginary part 0 
        xn16 = 32'h11000000; // Real part 17, Imaginary part 0 
        xn17 = 32'h12000000; // Real part 18, Imaginary part 0 
        xn18 = 32'h13000000; // Real part 19, Imaginary part 0 
        xn19 = 32'h14000000; // Real part 20, Imaginary part 0 
        xn20 = 32'h15000000; // Real part 21, Imaginary part 0 
        xn21 = 32'h16000000; // Real part 22, Imaginary part 0 
        xn22 = 32'h17000000; // Real part 23, Imaginary part 0 
        xn23 = 32'h18000000; // Real part 24, Imaginary part 0 
        xn24 = 32'h19000000; // Real part 25, Imaginary part 0 
        xn25 = 32'h1A000000; // Real part 26, Imaginary part 0 
        xn26 = 32'h1B000000; // Real part 27, Imaginary part 0 
        xn27 = 32'h1C000000; // Real part 28, Imaginary part 0 
        xn28 = 32'h1D000000; // Real part 29, Imaginary part 0 
        xn29 = 32'h1E000000; // Real part 30, Imaginary part 0 
        xn30 = 32'h1F000000; // Real part 31, Imaginary part 0 
        xn31 = 32'h20000000; // Real part 32, Imaginary part 0 
 
        // Wait for some time to observe the output 
        #10; 
 
        // End the simulation after a set period 
        $finish; 
    end 
 
    // Monitor the outputs to observe the result 
    initial begin 
        $monitor("Time: %t | xk0: %h | xk1: %h | xk2: %h | xk3: %h | xk4: 
%h | xk5: %h | xk6: %h | xk7: %h", 
                 $time, xk0, xk1, xk2, xk3, xk4, xk5, xk6, xk7); 
    end 
 
endmodule 
