module Demux(
    input enable,
    input I,
    input [1:0] sel,
    output reg [3:0] O
);

// always@(*) begin
//     case({enable, sel})
//         3'b100: O = {3'b000, I};
//         3'b101: O = {2'b00, I, 1'b0};
//         3'b110: O = {1'b0, I, 2'b00};
//         3'b111: O = {I, 3'b000};
//         default: O = 4'b0000;
//     endcase
// end

always@(*) begin
    if(enable == 0) O = 4'b0000;
    else if(sel == 2'b00) O = {3'b000, I};
    else if(sel == 2'b01) O = {2'b00, I, 1'b0};
    else if(sel == 2'b10) O = {1'b0, I, 2'b00};
    else if(sel == 2'b11) O = {I, 3'b000};
end

endmodule