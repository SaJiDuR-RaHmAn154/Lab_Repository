`timescale 1ns/1ps

module Priority_Encoder_Tb;
    reg E;
    reg [3:0] D;
    wire [1:0] B;

    Priority_Encoder circuit(E, D, B);

    initial begin
        $dumpfile("./out/Priority_encoder_gtk.vcd");
        $dumpvars(0, Priority_Encoder_Tb);

        E = 0;
        #10;
        E = 1;

        D = 4'b0001;
        #10;
        D = 4'b0010;
        #10;
        D = 4'b0100;
        #10;
        D = 4'b1000;
        #10;
        D = 4'b0011;
        #10;
        D = 4'b0110;
        #10;
        D = 4'b1100;
        #10;
        D = 4'b1010;
        #10;
    end

    initial
        $monitor("E = %b, D = %4b | B = %2b", E, D, B);

endmodule