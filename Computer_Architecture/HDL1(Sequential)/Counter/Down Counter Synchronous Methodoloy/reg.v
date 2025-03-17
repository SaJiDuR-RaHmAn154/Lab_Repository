module register (
    input wire clk,
    input wire reset,
    input wire [3:0] d,
    output wire [3:0] q
);
reg [3:0] r_reg;
wire [3:0] r_next;
always @(posedge clk,posedge reset) begin
    if(reset)r_reg<=4'b1111;
    else r_reg<=r_next;
end

assign r_next=d;
assign q=r_reg;
endmodule

