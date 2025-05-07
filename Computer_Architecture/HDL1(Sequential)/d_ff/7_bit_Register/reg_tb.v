`timescale 1ns/1ns

module reg_tb;

reg clk;
reg reset;
reg [6:0] d;
wire [6:0] q;

reg_ circuit(clk,reset,d,q);

always begin
    clk = ~clk;
    #10; 
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,reg_tb);

    clk<=0;
    reset<=1;
    d<=7'b0000000;
    #20;

    reset<=0;
    d<=7'b0000001;
    #20;

    $finish;
end

initial begin
    $monitor("clk=%b,reset=%b,d=%b,q=%b",clk,reset,d,q);
end
endmodule