// Problem - 1

`timescale 1ns/1ps

module Register16_Tb;
    reg [15:0] D;
    reg clk;
    reg reset;
    wire [15:0] Q;

    Register16 register(D, clk, reset, Q);

    always begin
        #10 clk = ~clk;
    end

    initial begin
        $dumpfile("./out/Register16_gtk.vcd");
        $dumpvars(0, Register16_Tb);

        clk <= 0;
        reset <= 0;
        D <= 16'b1111_0000_0000_1111;
        #20;
        reset <= 1;
        #20;
        D <= 16'b0000_0000_1111_0000;
        #20;
        D <= 16'b1111_0000_0000_0000;
        #20;
        reset <= 0;
        #20;
        D <= 16'b0000_1111_0000_0000;
        #20;
        reset <= 1;
        #20;
        D <= 16'b0000_0000_1111_0000;
        #20;

        $finish;
    end

    initial
        $monitor("clk = %b, reset = %b, D = %16b", clk, reset, D);
endmodule