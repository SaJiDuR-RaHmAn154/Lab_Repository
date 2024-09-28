// Problem - 5

`timescale 1ns/1ns

module DownCounter_Tb;
reg clk;
reg reset;
wire [3:0] q;

DownCounter counter(clk, reset, q);

always begin
    #10 clk = ~clk;
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, DownCounter_Tb);
    clk <= 0;
    reset <= 1;
    #20;
    reset <= 0;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
    #20;
end

initial begin
    $monitor("clk = %b, reset = %b, q = %4b", clk, reset, q);
end
endmodule