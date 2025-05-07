module fa (
    input wire A,
    input wire B,
    input wire Cin,
    output wire S,
    output wire Co
);

assign S = A^B^Cin;
assign Co = A&B | Cin&(A^B);
    
endmodule