module adder4bit (
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    output wire [3:0] S,
    output wire Co
);

wire Cin1,Cin2,Cin3;
fa circ1(A[0],B[0],Cin,S[0],Cin1);
fa circ2(A[1],B[1],Cin1,S[1],Cin2);
fa circ3(A[2],B[2],Cin2,S[2],Cin3);
fa circ4(A[3],B[3],Cin3,S[3],Co);
    
endmodule