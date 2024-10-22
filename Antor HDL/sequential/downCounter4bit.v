// Problem - 3

module Register4 (
    input wire [3:0] D,
    input wire clk,
    input wire reset,
    output reg [3:0] Q
);

always @(posedge clk, posedge reset) begin
    if(reset == 1'b1)
        Q <= 4'b0000;
    else
        Q <= D;
end
    
endmodule


module subOne(
    input wire [3:0] I,
    output wire [3:0] O
);

assign O = I - 1;

endmodule


module DownCounter4bit(
    input wire clk,
    input wire reset,
    output wire [3:0] q
);

wire [3:0] r_reg, r_next;

Register4 register(r_next, clk, reset, r_reg);
subOne subtractor(r_reg, r_next);
assign q = r_reg;

endmodule