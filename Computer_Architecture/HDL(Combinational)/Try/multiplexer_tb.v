`timescale 1ns/1ps

module Multiplexer_Tb;
    reg [3:0] I;
    reg [1:0] S;
    reg E;
    wire Y;

    Multiplexer circuit(I, S, E, Y);

    initial begin
        $dumpfile("test.vcd");
        $dumpvars(0, Multiplexer_Tb);

        E = 0;
        #10;
        E = 1;

        I = 4'b0101;
        #10;
        S = 2'b00;
        #10;
        S = 2'b01;
        #10;
        S = 2'b10;
        #10;
        S = 2'b11;
        #10;
    end

    initial
        $monitor("E = %b, I = %4b, S = %2b | Y = %b", E, I, S, Y);

endmodule