`timescale 1ns / 1ps

module tb_CLA_8bit_sat_out;

    parameter N = 8;
    logic signed [N-1:0] A, B;
    logic signed [N-1:0] Sum_cla;   
    logic ovf, uvf;
    int x, y;


    CLA_8bit_sat_out dut (
        .A(A),
        .B(B),
        .Sum(Sum_cla),
        .ovf(ovf),
        .uvf(uvf)
    );

    initial begin
        $display("=== Starting CLA_8bit Testbench ===");

        
        for (x = -8; x <= 7; x = x + 1) begin
            for (y = -8; y <= 7; y = y + 1) begin
                A = x;
                B = y;
                #20;  
                $display("A=%0d B=%0d => Sum=%0d f_ovf=%0d f_uvf=%0d", A, B, Sum_cla, ovf, uvf);
            end
        end

        // Extra test cases for overflow and underflow
        A = 8'b01001000; B = 8'b01100100; #20;  
        $display("A=%0d B=%0d => Sum=%0d f_ovf=%0d f_uvf=%0d", A, B, Sum_cla, ovf, uvf);
        A = 8'b10000001; B = 8'b10011000; #20;
        $display("A=%0d B=%0d => Sum=%0d f_ovf=%0d f_uvf=%0d", A, B, Sum_cla, ovf, uvf);

        $display("=== Test completed ===");
        $stop;
    end

endmodule
