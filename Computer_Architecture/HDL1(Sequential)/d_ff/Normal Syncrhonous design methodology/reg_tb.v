`timescale 1ns/1ns

module reg_tb;

reg clk;
reg reset;
reg en;
reg d;
wire q;

register circ(clk,reset,en,d,q);

always begin
    clk=~clk;
    #10;
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,reg_tb);

    clk<=0;
    reset<=1;
    en<=0;
    d<=0;

    #20;
    reset<=0;
    en<=1;
    d<=1;

    #40;
    $finish;
end

initial begin
    $monitor("clk=%b|reset=%b|en=%b|d=%b|q=%b",clk,reset,en,d,q);
end
endmodule