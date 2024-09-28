module RAM2x2bit_tb;
    reg clk;
    reg reset;
    reg [1:0] Write_Data;
    reg Write_Address;
    reg Write_Enable;
    reg Read_Address_1;
    reg Read_Address_2;
    wire [1:0] Read_Data_1;
    wire [1:0] Read_Data_2;

    RAM2x2bit uut (
        .clk(clk),
        .reset(reset),
        .Write_Data(Write_Data),
        .Write_Address(Write_Address),
        .Write_Enable(Write_Enable),
        .Read_Address_1(Read_Address_1),
        .Read_Address_2(Read_Address_2),
        .Read_Data_1(Read_Data_1),
        .Read_Data_2(Read_Data_2)
    );

    always 
    begin
        clk = ~clk; 
        #5;
    end 

    initial begin
        $dumpfile("test3.vcd");
        $dumpvars(0, RAM2x2bit_tb);

        clk = 0;
        reset = 1;  
        Write_Data = 2'b00;
        Write_Address = 1'b0;
        Write_Enable = 0;
        Read_Address_1 = 1'b0;
        Read_Address_2 = 1'b0;
        #10;

        reset = 0;  
        #10;

        Write_Enable = 1;
        Write_Address = 1'b0; Write_Data = 2'b01; Read_Address_1 = 1'b0; Read_Address_2 = 1'b1;
        #10;

        Write_Address = 1'b1; Write_Data = 2'b11; Read_Address_1 = 1'b0; Read_Address_2 = 1'b1;
        #10;

        Write_Enable = 0;
        Write_Address = 1'b1; Write_Data = 2'b00; Read_Address_1 = 1'b0; Read_Address_2 = 1'b1;
        #10;

        $finish;
    end


    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | WE = %b | WA = %b | WD = %b | RA1 = %b | RD1 = %b | RA2 = %b | RD2 = %b", 
                 $time, clk, reset, Write_Enable, Write_Address, Write_Data, 
                                    Read_Address_1, Read_Data_1, Read_Address_2, Read_Data_2);
    end

endmodule
