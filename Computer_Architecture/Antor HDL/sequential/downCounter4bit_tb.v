// Problem - 3

`timescale 1ns/1ns

module DownCounter4bit_Tb;
    reg clk;
    reg reset;
    wire [3:0] q;

    DownCounter4bit counter(clk, reset, q);

    always begin
        #10 clk = ~clk;
    end

    initial begin
        $dumpfile("./out/Counter4bit_gtk.vcd");
        $dumpvars(0, DownCounter4bit_Tb);

        clk <= 0;
        reset <= 0;
        #20;
        reset <= 1;
        #20;
        reset <= 0;
        #20;
        #20;
        #20;
        #20;
        #20;
        reset <= 1;
        #20;

        $finish;
    end

    initial
        $monitor("clk = %b, reset = %b, q = %4b", clk, reset, q);
endmodule