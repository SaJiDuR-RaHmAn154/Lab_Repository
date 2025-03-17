`timescale 1ns/1ns

module counter_tb;

reg clk;
reg reset;
wire [3:0] q;

counter circ(clk,reset,q);

always begin
    clk = ~clk;
    #10;
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,counter_tb);

    clk<=0;
    reset<=1;
    #20;
    reset<=0;
    #20;
end

initial begin
    $monitor("clk=%b,reset=%b,q=%b",clk,reset,q);
end
endmodule