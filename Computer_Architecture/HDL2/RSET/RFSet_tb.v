`timescale 1ns/1ns

module RFSet_tb;
    reg clk;
    reg reset;
    reg [1:0] RA;
    reg [1:0] RB;
    reg RE;
    reg [1:0] WR;
    reg [3:0] WRD;
    wire [3:0] A;
    wire [3:0] B;

    RFSet uut (
        .clk(clk),
        .reset(reset),
        .RA(RA),
        .RB(RB),
        .RE(RE),
        .WR(WR),
        .WRD(WRD),
        .A(A),
        .B(B)
    );

    always 
    begin
        clk = ~clk; 
        #5;
    end 

    initial begin
        $dumpfile("test3.vcd");
        $dumpvars(0, RFSet_tb);

        clk = 0;
        reset = 1;  
        RA = 2'b00;
        RB = 2'b00;
        RE = 0;
        WR = 2'b00;
        WRD = 4'b0000;
        #10;

        reset = 0;  
        #10;

        RE = 1; 
        
        WR = 2'b00; WRD = 4'b1101; RA = 2'b00; RB = 2'b00; 
        #10;

        WR = 2'b01; WRD = 4'b0011; RA = 2'b01; RB = 2'b01; 
        #10;

        WR = 2'b10; WRD = 4'b1010; RA = 2'b10; RB = 2'b10; 
        #10;

        WR = 2'b11; WRD = 4'b0111; RA = 2'b11; RB = 2'b11; 
        #10;

        RE = 0; 

        WR = 2'b00; WRD = 4'b1111; RA = 2'b00; RB = 2'b00; 
        #10;

        $finish;
    end

    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | RA = %b | RB = %b | WR = %b | WRD = %b | RE = %b | A = %b | B = %b", 
                 $time, clk, reset, RA, RB, WR, WRD, RE, A, B);
    end

endmodule
