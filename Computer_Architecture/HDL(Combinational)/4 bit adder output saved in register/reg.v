module register (
    input wire clk,
    input wire reset,
    input wire en,
    input wire [3:0] d,
    output reg [3:0] q
);

reg [3:0] r_next;
reg [3:0] r_reg;

//Memory
always @(posedge clk,posedge reset) begin
    if(reset) r_reg = 4'b0000;
    else r_reg = r_next;
end

//Next_State_Logic
always @(*) begin
    if(en) r_next = d;
    else r_next = r_reg;
end

//Output logic
always @(*) begin
    q = r_reg;
end
endmodule