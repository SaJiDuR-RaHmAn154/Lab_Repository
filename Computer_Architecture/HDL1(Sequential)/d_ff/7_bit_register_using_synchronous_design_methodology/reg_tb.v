`timescale 1ns/1ps

module reg_tb;

reg clk;
reg reset;
reg en;
reg [6:0] d;
wire [6:0] q;

reg_ cir(clk,reset,en,d,q);

always begin
    clk = ~clk;
    #10;
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,reg_tb);

    clk<=0;
    reset<=1;
    en<=0;
    d<=7'b0000000;

    #20;
    reset<=0;
    en<=1;
    d<=7'b0000001;
    #20;
end

initial begin
    $monitor("clk=%b,reset=%b,en=%b,d=%b,q=%b",clk,reset,en,d,q);
end
endmodule