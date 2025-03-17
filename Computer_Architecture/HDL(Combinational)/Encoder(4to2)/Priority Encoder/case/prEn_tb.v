`timescale 1ns/1ps

module prEn_tb;

reg [3:0] y;
wire [1:0] a;

prEn Circuit(y,a);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,prEn_tb);
    y=4'b0000;
    #20 y=4'b0001;
    #20  y=4'b001x;
    #20  y=4'b01xx; //Here 'x' is representing the don't care bit
    #20  y=4'b1xxx;
    #20  y=4'b0111;
    #40;
    $finish;
end

initial begin
     $monitor("y3=%b|y2=%b|y1=%b|y0=%b|a1=%b|a0=%b",y[3],y[2],y[1],y[0],a[1],a[0]);
end
endmodule