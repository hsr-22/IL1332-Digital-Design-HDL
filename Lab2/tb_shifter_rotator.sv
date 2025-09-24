`timescale 1ns / 1ps

module tb_shifter_rotator;

    // Parameters
    parameter WIDTH = 4;

    // Declare inputs and outputs
    logic [WIDTH-1:0] x;
    logic [1:0] select;
    logic [WIDTH-1:0] y;

    // Instantiate the shifter_rotator module
    shifter_rotator uut (
        .x(x),
        .select(select),
        .y(y)
    );

    // Test procedure
    initial begin
        // Test all possible cases for 4-bit input x and 2-bit select
        for (int i = 0; i < 2**WIDTH; i++) begin
            for (int j = 0; j < 4; j++) begin
                // Set inputs
                x = i;
                select = j;

                // Wait for some time to simulate combinational logic delay
                #20;

                // Display results
                $display("x=%b, select=%b, y=%b", x, select, y);
            end
        end

        $stop; // End simulation
    end
endmodule