`timescale 1ns/1ps

module ct_tb;

reg clk;
reg reset;
wire [3:0] q;

ct circ3(clk,reset,q);

always begin
     clk = ~clk;
    #10;
end

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,ct_tb);

    clk<=0;
    reset<=1;

    #10;
    reset<=0;

    #10;
    #10;
    #10;
    #10;

end

initial begin
    $monitor("clk=%b|reset=%b|q=%b",clk,reset,q);
end
endmodule