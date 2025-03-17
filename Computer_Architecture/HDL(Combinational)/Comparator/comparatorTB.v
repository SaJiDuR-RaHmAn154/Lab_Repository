`timescale 1ns/1ps


module comparatorTB();

reg x;
reg y;
wire z;

comparator circuit(
    .x(x),
    .y(y),
    .z(z)
);


initial begin

$dumpfile("comparatorTB.vcd");
$dumpvars(0,comparatorTB);

    x=0;
    y=0;

    #20 y=1;
    #20 x=1 ; y=0;
    #20 y=1;
end

initial begin
    $monitor("x=%d|y=%d|z=%d",x,y,z);
end
endmodule