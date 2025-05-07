module register (
    input wire clk,
    input wire reset,
    input wire [3:0] d,
    output reg [3:0] q
);

always @(posedge clk,posedge reset) begin
    if(reset) q<=4'b1111;
    else q<=d;
end    
endmodule