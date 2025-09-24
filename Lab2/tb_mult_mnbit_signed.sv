`timescale 1ns / 1ps

module tb_mult_mnbit_signed;

    // Parameters for M and N
    parameter M = 4;
    parameter N = 3;

    // Declare inputs and outputs
    logic [M-1:0] A;
    logic [N-1:0] B;
    logic [M+N-1:0] Prod;

    // Instantiate the mult_mnbit module
    mult_mnbit_signed #(M, N) uut (
        .A(A),
        .B(B),
        .Prod(Prod)
    );

    // Test procedure
    initial begin
        // Test all possible cases for M-bit input A and N-bit input B
        for (int i = -7; i < 8; i++) begin
            for (int j = -4; j < 4; j++) begin
                // Set inputs
                A = i;
                B = j;

                // Wait for some time to simulate combinational logic delay
                #20;

                // Display results
                $display("A=%0d, B=%0d, Prod=%0d", A, B, Prod);
            end
        end

        $stop; // End simulation
    end
endmodule
