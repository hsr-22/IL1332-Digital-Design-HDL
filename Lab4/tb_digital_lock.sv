`timescale 1ns / 1ps

module tb_digital_lock;

    // Testbench signals
    logic clk, rstn;
    logic [3:0] key;
    logic valid_key, state;

    digital_lock uut (
        .clk(clk),
        .rstn(rstn),
        .key(key),
        .valid_key(valid_key),
        .state(state)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Frequency = 100MHz
    end

    // Stimulus generation
    initial begin
        // Initialize
        rstn = 0;
        key = 0;
        valid_key = 0;
        #20;
        rstn = 1;
        #20;

        // Unlock with default PIN 1,2,3,4 + C
        key = 4'h1; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'h2; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'h3; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'h4; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'hC; valid_key = 1; #10; valid_key = 0; #20;

        // Lock using B
        key = 4'hB; valid_key = 1; #10; valid_key = 0; #20;

        // Enter CHANGE mode (E)
        key = 4'hE; valid_key = 1; #10; valid_key = 0; #10;
        // Enter new PIN 4,3,2,1
        key = 4'h4; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'h3; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'h2; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'h1; valid_key = 1; #10; valid_key = 0; #20;

        // Lock again
        key = 4'hB; valid_key = 1; #10; valid_key = 0; #20;

        // Try unlocking with new PIN 4,3,2,1 + C
        key = 4'h4; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'h3; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'h2; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'h1; valid_key = 1; #10; valid_key = 0; #10;
        key = 4'hC; valid_key = 1; #10; valid_key = 0; #50;

        $stop; // End simulation
    end

endmodule