// Problem - 2

`timescale 1ns/1ns

module Register7Enable_Tb;
    reg [6:0] D;
    reg clk;
    reg reset;
    reg enable;
    wire [6:0] Q;

    Register7Enable register(D, clk, reset, enable, Q);

    always begin
        #10 clk = ~clk;
    end

    initial begin
        $dumpfile("./out/Register7Enable_gtk.vcd");
        $dumpvars(0, Register7Enable_Tb);

        clk <= 0;
        reset <= 0;
        D <= 16'b1111_000;
        #20;
        reset <= 1;
        #20;
        D <= 16'b0000_001;
        #20;
        D <= 16'b1111_000;
        #20;
        reset <= 0;
        #20;
        enable <= 0;
        D <= 16'b0000_111;
        #20;
        reset <= 1;
        #20;
        D <= 16'b0000_001;
        #20;

        $finish;
    end

    initial
        $monitor("clk = %b, reset = %b, enable = %b, D = %7b", clk, reset, enable, D);
endmodule