`timescale 1ns / 1ps

module tb_alu;

    // Testbench signals
    logic [7:0] X;                 // 8-bit input X
    logic [7:0] Y;                 // 8-bit input Y
    logic [1:0] M;                 // Function select
    logic [1:0] S;                 // Category select
    logic [15:0] Z;                // 16-bit output Z

    // Instantiate the ALU
    alu alu (
        .x(X),
        .y(Y),
        .m(M),
        .s(S),
        .z(Z)
    );

    initial begin
        // Iterate through all combinations of S (0 to 3)
        for (int s = 0; s < 4; s++) begin
            // Iterate through all combinations of M (0 to 3)
            for (int m = 0; m < 4; m++) begin
                // Random inputs for X and Y
                X = $urandom_range(0, 255); // Random 8-bit value
                Y = $urandom_range(0, 255); // Random 8-bit value

                M = m[1:0]; // Select function
                S = s[1:0]; // Select category

                // Wait for a clock cycle
                #20;

                // Display the inputs and output
                //$display("X=%h, Y=%h, M=%b, S=%b => Z=%h", X, Y, M, S, Z);
            end
        end
        $stop; // End simulation
    end

endmodule
