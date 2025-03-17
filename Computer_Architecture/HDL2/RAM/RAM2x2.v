module RAM2x2bit (
    input wire clk,
    input wire reset,
    input wire [1:0] Write_Data,
    input wire Write_Address,
    input wire Write_Enable,  
    input wire Read_Address_1,
    input wire Read_Address_2,
    output wire [1:0] Read_Data_1,
    output wire [1:0] Read_Data_2
);

    wire [1:0] RD1_row00, RD1_row01;
    wire [1:0] RD2_row00, RD2_row01;
    reg [1:0] WR_SEL, RD1_SEL, RD2_SEL;

    RAM1x2bit ram_row00 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[0]), 
        .Read_Select_1(RD1_SEL[0]), 
        .Read_Select_2(RD2_SEL[0]), 
        .Read_Data_1(RD1_row00), 
        .Read_Data_2(RD2_row00)
    );

    RAM1x2bit ram_row01 
    (
        .clk(clk), 
        .reset(reset), 
        .Write_Data(Write_Data), 
        .Write_Select(WR_SEL[1]), 
        .Read_Select_1(RD1_SEL[1]), 
        .Read_Select_2(RD2_SEL[1]), 
        .Read_Data_1(RD1_row01), 
        .Read_Data_2(RD2_row01)
    );

    always @(*) 
       begin
            case ({Write_Enable, Write_Address})
                2'b10: WR_SEL = 2'b01;
                2'b11: WR_SEL = 2'b10;
                default: WR_SEL = 2'b00;
            endcase
        end 

    always @(*) 
        begin
            case (Read_Address_1)
                1'b0: RD1_SEL = 2'b01;
                1'b1: RD1_SEL = 2'b10;
                default: RD1_SEL = 2'b00;
            endcase
        end

    always @(*) 
        begin
            case (Read_Address_2)
                1'b0: RD2_SEL = 2'b01;
                1'b1: RD2_SEL = 2'b10;
                default: RD2_SEL = 2'b00;
            endcase
        end

    assign Read_Data_1 = RD1_row00 | RD1_row01;
    assign Read_Data_2 = RD2_row00 | RD2_row01;

endmodule
