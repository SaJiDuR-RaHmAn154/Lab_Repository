module RAM1x2bit (
    input wire clk,
    input wire reset,
    input wire [1:0] Write_Data,
    input wire Write_Select,  
    input wire Read_Select_1,  
    input wire Read_Select_2,
    output wire [1:0] Read_Data_1,
    output wire [1:0] Read_Data_2
);

RAM1x1bit cir1stbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[0]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[0]), 
    .Read_Data_2(Read_Data_2[0])
);

RAM1x1bit cir2ndbit 
(
    .clk(clk), 
    .reset(reset), 
    .Write_Data(Write_Data[1]), 
    .Write_Select(Write_Select), 
    .Read_Select_1(Read_Select_1), 
    .Read_Select_2(Read_Select_2), 
    .Read_Data_1(Read_Data_1[1]), 
    .Read_Data_2(Read_Data_2[1])
);

endmodule
