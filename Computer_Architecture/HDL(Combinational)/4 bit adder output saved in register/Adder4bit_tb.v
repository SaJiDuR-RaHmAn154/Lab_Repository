`timescale 1ns/1ns

module adder4bit_tb;

reg [3:0] A;
reg [3:0] B;
reg Cin;
reg clk;
reg reset;
reg en;
wire [3:0] S;
wire [3:0] q;
wire Co;

adder4bit circ(A,B,Cin,clk,reset,en,S,q,Co);

always begin
    clk=~clk;
    #10;
end
initial begin
    $dumpfile("test1.vcd");
    $dumpvars(0,adder4bit_tb);
        
        clk<=0;
        en<=0;
        reset<=1;

        Cin = 1'b0;
        A = 4'b1111;
        B = 4'b1111;
        #20;
        en<=1;
        reset<=0;
        #20;
        Cin = 1'b0;
        A = 4'b0001;
        B = 4'b0001;
        #20;
        Cin = 1'b0;
        A = 4'b0110;
        B = 4'b0001;
        #20;
        $finish;
end

initial begin
    $monitor("clk=%b|reset=%b|en=%b|A=%b|B=%b|Cin=%b|d=%b|q=%b",clk,reset,en,A,B,Cin,S,q);
end
endmodule