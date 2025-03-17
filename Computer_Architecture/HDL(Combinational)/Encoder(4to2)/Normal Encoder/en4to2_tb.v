`timescale 1ns/1ps
module encoder_tb;

reg [3:0] Y;
wire [1:0] A;

encoder uut
(
  .Y(Y),
  .A(A)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0,encoder_tb);
    Y=4'b0001;
    #20 Y=4'b0010;
    #20 Y=4'b0100;
    #20 Y=4'b1000;
    #40;
    $finish;
end

initial begin
    $monitor("Y3=%d|Y2=%d|Y1=%d|Y0=%d|A1=%d|A0=%d",Y[3],Y[2],Y[1],Y[0],A[1],A[0]);
end

endmodule