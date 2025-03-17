`timescale 1ns/1ns

module adder4bit_tb;

reg [3:0] A;
reg [3:0] B;
reg Cin;
wire [3:0] S;
wire Co;

adder4bit circ(A,B,Cin,S,Co);

initial begin
    $dumpfile("test1.vcd");
    $dumpvars(0,adder4bit_tb);

        Cin = 1'b0;
        A = 4'b0000;
        B = 4'b0000;

        #20;
        Cin = 1'b0;
        A = 4'b0001;
        B = 4'b0001;

        #20;
        Cin = 1'b0;
        A = 4'b0001;
        B = 4'b0010;

        #20;
        Cin = 1'b0;
        A = 4'b1111;
        B = 4'b1111;

        #20;
        Cin = 1'b1;
        A = 4'b1000;
        B = 4'b0001;

        #20;
        $finish;
end

initial begin
    $monitor("Cin=%b|A=%b|B=%b|Co=%b|S=%b",Cin,A,B,Co,S);
end
endmodule