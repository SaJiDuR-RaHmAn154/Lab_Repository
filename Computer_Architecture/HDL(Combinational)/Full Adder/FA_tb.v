`timescale 1ns/1ns

module fa_tb;

reg A;
reg B;
reg Cin;
wire S;
wire Co;

fa cir(A,B,Cin,S,Co);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,fa_tb);

    Cin=0;A=0;B=0;

    #20 B=1;    
    #20 A=1;B=0;
    #20 B=1;
    #20 Cin=1;A=0;B=0;
    #20 B=1;    
    #20 A=1;B=0;    
    #20 B=1;    
    #20;
    $finish;
end

initial begin
    $monitor("Cin=%d|A=%d|B=%d|Co=%d|S=%d",Cin,A,B,Co,S);
end
endmodule