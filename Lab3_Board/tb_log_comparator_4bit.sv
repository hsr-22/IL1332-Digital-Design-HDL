`timescale 1ns / 1ps

module tb_log_comparator_4bit;

    parameter N = 4;

    logic [N-1:0] A;
    logic [N-1:0] B;
    logic         g, l;

    // Instantiate the comparator
    log_comparator_4bit uut (
        .A(A),
        .B(B),
        .g(g),
        .l(l)   
    );

    initial begin
        for (int i = 0; i < 15; i++) begin
            for (int j = 0; j < 15; j++) begin
                A = i;
                B = j;
                #30; // Wait for some time to observe the output
                $display("A = %0d, B = %0d, g = %0d, l = %0d", A, B, g, l);
            end
        end

        $stop;
    end

endmodule
