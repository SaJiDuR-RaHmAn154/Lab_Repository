// Problem - 4

module Register4_Synchronous (
    input wire [3:0] D,
    input wire clk,
    input wire reset,
    output wire [3:0] Q
);

wire [3:0] r_next;
reg [3:0] r_reg;

// Memory
always @(posedge clk, posedge reset) begin
    if(reset == 1'b1)
        r_reg <= 4'b0000;
    else
        r_reg <= r_next;
end

// Next State Logic
assign r_next = D;

// Output Logic
assign Q = r_reg;
    
endmodule


module subOne(
    input wire [3:0] I,
    output wire [3:0] O
);

assign O = I - 1;

endmodule


module DownCounter4bit_Synchronous(
    input wire clk,
    input wire reset,
    output wire [3:0] q
);

wire [3:0] r_reg, r_next;

Register4_Synchronous register(r_next, clk, reset, r_reg);
subOne subtractor(r_reg, r_next);

// Output Logic
assign q = r_reg;

endmodule