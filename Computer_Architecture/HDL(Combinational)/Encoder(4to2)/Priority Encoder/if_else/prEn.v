module prEn (
    input wire [3:0] y,
    output reg [1:0] a
);
    
always @(*) 
begin
    if(y==4'b0000) a = 2'b00; 
    else if(y[0]==1'b1 && y[3:1]==3'b000) a = 2'b00; 
    else if(y[1]==1'b1 && y[3:2]==2'b00) a = 2'b01; 
    else if(y[2]==1'b1 && y[3]==1'b0) a = 2'b10; 
    else if(y[3]==1'b1) a = 2'b11; 
end
endmodule