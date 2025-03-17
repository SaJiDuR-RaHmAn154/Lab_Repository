`timescale 1ns/1ps

module DeMultiplexer_Tb;
    reg Y;
    reg [1:0] S;
    reg E;
    wire [3:0] I;

    DeMultiplexer circuit(Y, S, E, I);

    initial begin
        $dumpfile("./out/DeMultiplexer_gtk.vcd");
        $dumpvars(0, DeMultiplexer_Tb);

        E = 0;
        #10;
        E = 1;
        Y = 1'b1;
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
        $monitor("E = %b, Y = %b, S = %2b | I = %4b", E, Y, S, I);

endmodule