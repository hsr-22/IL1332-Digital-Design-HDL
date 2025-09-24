`timescale 1ns/1ps

module tb_mult_add;

    // Inputs
    logic [3:0] a0, a1, a2, a3, a4, a5, a6, a7;
    // Output
    logic [9:0] x;

    // Instantiate the DUT
    mult_add dut (
        .a0(a0), .a1(a1), .a2(a2), .a3(a3),
        .a4(a4), .a5(a5), .a6(a6), .a7(a7),
        .x(x)
    );

    // Task to apply stimulus and display result
    task automatic apply_and_check(
        input [3:0] ta0, ta1, ta2, ta3, ta4, ta5, ta6, ta7
    );
        begin
            a0 = ta0; a1 = ta1; a2 = ta2; a3 = ta3;
            a4 = ta4; a5 = ta5; a6 = ta6; a7 = ta7;
            #50; // Wait for outputs to settle
            $display("a0=%0d a1=%0d a2=%0d a3=%0d a4=%0d a5=%0d a6=%0d a7=%0d | x=%0d",
                a0, a1, a2, a3, a4, a5, a6, a7, x);
        end
    endtask

    initial begin
        $display("Starting mult_add testbench...");

        // Test 1: All zeros
        apply_and_check(4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0, 4'd0);

        // Test 2: All ones
        apply_and_check(4'd1, 4'd1, 4'd1, 4'd1, 4'd1, 4'd1, 4'd1, 4'd1);

        // Test 3: All max values
        apply_and_check(4'd15, 4'd15, 4'd15, 4'd15, 4'd15, 4'd15, 4'd15, 4'd15);

        // Test 4: Alternating values
        apply_and_check(4'd0, 4'd15, 4'd0, 4'd15, 4'd0, 4'd15, 4'd0, 4'd15);

        // Test 5: Incrementing values
        apply_and_check(4'd1, 4'd2, 4'd3, 4'd4, 4'd5, 4'd6, 4'd7, 4'd8);

        // Test 6: Random values
        apply_and_check(4'd3, 4'd7, 4'd12, 4'd1, 4'd8, 4'd2, 4'd14, 4'd5);

        $display("Testbench finished.");
        $stop;
    end

endmodule