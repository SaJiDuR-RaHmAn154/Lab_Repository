module PrEncoder (
    input wire [3:0] y,
    output wire [1:0] a
);
    
assign a[0] = y[3] | (~y[3] & ~y[2] & y[1]);
assign a[1] = y[3] | (y[2] & ~y[3]);

endmodule