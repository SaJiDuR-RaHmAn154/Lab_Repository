module DeMultiplexer(
    input wire Y,
    input wire [1:0] S,
    input wire E,
    output reg [3:0] I
);

// assign I[0] = E & ~S[0] & ~S[1] & Y;
// assign I[1] = E & S[0] & ~S[1] & Y;
// assign I[2] = E & ~S[0] & S[1] & Y;
// assign I[3] = E & S[0] & S[1] & Y;

// always @(*) begin
//     if(E == 1'b0) 
//         I = 4'b0000;
//     else if(S == 2'b00) begin
//         I = 4'b0000;
//         I[0] = Y;
//         end
//     else if(S == 2'b01) begin
//         I = 4'b0000;
//         I[1] = Y;
//         end
//     else if(S == 2'b10) begin
//         I = 4'b0000; 
//         I[2] = Y;
//         end
//     else if(S == 2'b11) begin
//         I = 4'b0000; 
//         I[3] = Y;
//         end
//     else 
//         I = 4'b0000;
// end

always @(*) begin
    case({E, S})
        3'b100 : begin
            I = 4'b0000;
            I[0] = Y;
        end
        3'b101 : begin
            I = 4'b0000; 
            I[1] = Y;
        end
        3'b110 : begin
            I = 4'b0000; 
            I[2] = Y;
        end
        3'b111 : begin
            I = 4'b0000; 
            I[3] = Y;
        end
        default : I = 4'b0000;
    endcase
end

endmodule