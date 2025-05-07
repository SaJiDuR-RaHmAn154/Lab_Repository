`timescale 1ns/1ps

module multiplexer_tb;

reg [1:0] S;
reg [3:0] I;
wire Y;

multiplexer uut(S,I,Y);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,multiplexer_tb);

    I=4'b1111;
    S=2'b00;
    #20 S=2'b01;
    #20 S=2'b10;
    #20 S=2'b11;
end

initial begin
    $monitor("S1=%b|S0=%b|Y=%b",S[1],S[0],Y);
end
    
endmodule