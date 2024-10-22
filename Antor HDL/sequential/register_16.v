// Problem - 1

module Register16 (
    input wire [15:0] D,
    input wire clk,
    input wire reset,
    output reg [15:0] Q
);

always @(posedge clk, posedge reset) begin
    if(reset == 1'b0)
        Q <= D;
    else 
        Q <= 16'b0000_0000_0000_0000;
end
    
endmodule