// Problem - 5

module DownCounter(
    input clk,
    input reset,
    output [3:0] q
);

// Memory Logic
wire [3:0] r_next;
reg [3:0] r_reg;

always @(posedge clk, posedge reset) begin
    if(reset == 1'b1)
        r_reg <= 4'b0000;
    else 
        r_reg <= r_next;

end

// Next State Logic
assign r_next = r_reg - 1;;

// Outptu Logic 
assign q = r_reg;
// always @(*) begin
//     q <= r_reg;
// end

endmodule