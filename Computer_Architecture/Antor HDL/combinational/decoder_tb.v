`timescale 1ns/1ps

module Decoder_Tb;
    reg [2:0] B;
    reg E;
    wire [7:0] D;

    Decoder cir1(
        .B(B), 
        .D(D),
        .E(E)
    );

    initial begin

        $dumpfile("Decoder_gtk.vcd");
        $dumpvars;

        E = 0;
        #10;
        E = 1;

        B = 3'b000;
        #10;
        B = 3'b001;
        #10;
        B = 3'b010;
        #10;        
        B = 3'b011;
        #10;        
        B = 3'b100;
        #10;        
        B = 3'b101;
        #10;        
        B = 3'b110;
        #10;
        B = 3'b111;
        #10;

    end

    initial begin
        $monitor("E = %b, B = %3b | D = %8b", E, B, D);
    end

endmodule

