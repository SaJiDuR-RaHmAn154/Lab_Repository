// Problem - 2

module Register7Enable (
    input wire [6:0] D,
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [6:0] Q
);

always @(posedge clk, posedge reset) begin
    if(reset == 1'b1)
        Q <= 7'b0000_000;
    else if(enable == 1'b1)
        Q <= D;
    else 
        Q <= Q;
end
    
endmodule