module reg_ (
    input wire clk,
    input wire reset,
    input wire en,
    input wire [6:0] d,
    output reg [6:0] q
);

reg [6:0] r_next;
reg [6:0] r_reg;

//Memory
always @(posedge clk,posedge reset) begin
    if(reset) r_reg = 7'b0000000;
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