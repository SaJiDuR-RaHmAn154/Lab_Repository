`timescale 1ns/1ns

module alu_tb;

reg [3:0] A, B;       
reg [1:0] OP;          
wire [3:0] R;          
wire CF;               

    alu uut (
        .A(A),
        .B(B),
        .OP(OP),
        .R(R),
        .CF(CF)
    );

    initial begin
        $dumpfile("test3.vcd");
        $dumpvars(0, alu_tb);

        A = 4'b0100; B = 4'b0011; OP = 2'b00;
        #10;

        A = 4'b1000; B = 4'b0010; OP = 2'b01;
        #10;

        A = 4'b0111; B = 4'b0101; OP = 2'b10;
        #10;

        A = 4'b0110; B = 4'b1001; OP = 2'b11;
        #10;

        A = 4'b1111; B = 4'b1111; OP = 2'b00;
        #10;

        A = 4'b1001; B = 4'b0100; OP = 2'b01;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b CF=%b", $time, A, B, OP, R, CF);
    end

endmodule
