`timescale 1ns / 1ps

module tb_CLA_8bit;

    parameter N = 8;
    logic signed [N-1:0] A, B;
    logic signed [N:0] Sum_cla;   
    int x, y;

    
    CLA_8bit dut (
        .A(A),
        .B(B),
        .Sum(Sum_cla)
    );

    initial begin
        $display("=== Starting CLA_8bit Testbench ===");

        
        for (x = -8; x <= 7; x = x + 1) begin
            for (y = -8; y <= 7; y = y + 1) begin
                A = x;
                B = y;
                #20;  
                $display("A=%0d B=%0d => Sum=%0d", A, B, Sum_cla);
            end
        end

        $display("=== Test completed ===");
        $stop;
    end

endmodule
