module ALU_ADD_SUB_Nbit 
(
    input wire [4:0] A,B,
    input wire Sel,      
    output wire [4:0] R,    
    output wire CF
);

    wire [4:0] B_complement;
    wire [4:0] B_selected;

    assign B_complement = ~B + 5'b00001;

    assign B_selected = (Sel) ? B_complement : B;

    assign {CF, R} = A + B_selected;

endmodule