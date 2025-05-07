module ADD_SUB4bit 
(
    input wire [3:0] A,B,  
    output wire [3:0] R,    
    output wire CF
);
    assign {CF, R} = A - B;


endmodule