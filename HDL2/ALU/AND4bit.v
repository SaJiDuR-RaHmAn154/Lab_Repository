module AND4bit 
(
    input wire [3:0] A,B,  
    output wire [3:0] R
);

assign R = (A&B);

endmodule