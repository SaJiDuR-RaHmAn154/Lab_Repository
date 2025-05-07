module adder4bit (
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    output wire [3:0] S,
    output wire Co
);

wire [4:0] result;
assign result = A + B + Cin;
assign Co = result[4];
assign S = result[3:0];
    
endmodule