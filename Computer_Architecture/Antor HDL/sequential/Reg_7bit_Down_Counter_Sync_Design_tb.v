`timescale 1ns/1ps

module Reg_7bit_Down_Counter_Sync_Design_Method_tb;
    reg clk, reset, enable;
    wire [6:0] Q;

    Reg_7bit_Down_Counter_Sync_Design_Method uut(.clk(clk), .reset(reset), .enable(enable), .Q(Q));

    always #5 clk = ~clk;

    initial $monitor($time, "Reset = %b Enable = %b clk = %b Output = %b", reset, enable, clk, Q);
    initial begin
        $dumpfile("DownCounter.vcd");
        $dumpvars(0, Reg_7bit_Down_Counter_Sync_Design_Method_tb);

        clk = 0;

        reset = 0;
        enable = 0;
        
        #10 reset = 1;
        #20 enable = 1;

        #60 reset = 0;

        #20 $finish;
    end

endmodule