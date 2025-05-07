module ALU_tb;
    reg [2:0] A, B;       
    reg [1:0] OP;          
    wire [2:0] R;          
    wire CF;
    wire SF;
    wire ZF;

    ALU uut (
        .A(A),
        .B(B),
        .OP(OP),
        .R(R),
        .CF(CF),
        .SF(SF),
        .ZF(ZF)
    );

    initial begin
        $dumpfile("test3.vcd");
        $dumpvars(0, ALU_tb);

        A = 3'b100; B = 3'b011; OP = 2'b00;
        #10;

        A = 3'b100; B = 3'b010; OP = 2'b01;
        #10;

        A = 3'b111; B = 3'b010; OP = 2'b10;
        #10;

        A = 3'b110; B = 3'b001; OP = 2'b11;
        #10;

        A = 3'b111; B = 3'b111; OP = 2'b00;
        #10;

        A = 3'b001; B = 3'b111; OP = 2'b01;
        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b OP=%b -> R=%b CF=%b ZF=%b SF=%b", $time, A, B, OP, R, CF, ZF, SF);
    end

endmodule
