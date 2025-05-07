`timescale 1ns/1ps

module decoder_3to8_assign_tb;


reg [2:0] A;
reg E;
wire [7:0] Y;

decoder_3to8_assign uut
(
   .A(A),
   .E(E),
   .Y(Y)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,decoder_3to8_assign_tb);
    
    E=0;
    A=3'b000;
    
    #20 E=1;
    #20 A=3'b000;
    #20 A=3'b001;
    #20 A=3'b010;
    #20 A=3'b011;
    #20 A=3'b100;
    #20 A=3'b101;
    #20 A=3'b110;
    #20 A=3'b111;
    #20;
end

initial begin
    $monitor("E=%b|A2=%b|A1=%b|A0=%b|Y7=%b|Y6=%b|Y5=%b|Y4=%b|Y3=%b|Y2=%b|Y1=%b|Y0=%b",E,A[2],A[1],A[0],Y[7],Y[6],Y[5],Y[4],Y[3],Y[2],Y[1],Y[0]);
end
endmodule