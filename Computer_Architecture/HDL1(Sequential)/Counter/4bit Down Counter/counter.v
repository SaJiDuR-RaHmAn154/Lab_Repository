module counter (
    input wire clk,
    input wire reset,
    output wire [3:0] q
);

wire [3:0] q_temp,d_temp;
register circ1(clk,reset,d_temp,q_temp);
subtractor circ2(q_temp,d_temp);

assign q = q_temp;
    
endmodule