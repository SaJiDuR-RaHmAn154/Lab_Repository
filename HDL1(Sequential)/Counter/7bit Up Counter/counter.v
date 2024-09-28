module counter (
    input wire clk,
    input wire reset,
    output wire [6:0] q
);

wire [6:0] q_temp,d_temp;
register circ1(clk,reset,d_temp,q_temp);
adder circ2(q_temp,d_temp);

assign q = q_temp;
    
endmodule