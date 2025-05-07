// Problem - 5

module DownCounter
(
    input clk,
    input reset,
    output [3:0] q
);

// Memory Logic
wire [3:0] r_next;
reg [3:0] r_reg;

always @(posedge clk, posedge reset) begin
    if(reset)
        r_reg <= 4'b1111;
    else 
        r_reg <= r_next;
end

// Next State Logic
assign r_next = r_reg - 1;

// Output Logic 
assign q = r_reg;

endmodule