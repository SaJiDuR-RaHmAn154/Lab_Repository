module adder4bit (
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    input wire clk,
    input wire reset,
    input wire en,
    output wire [3:0] S,
    output wire [3:0] q,
    output wire Co
);

wire [4:0] result;
assign result = A + B + Cin;
assign Co = result[4];
assign S = result[3:0];

register circ(clk,reset,en,S,q);
endmodule