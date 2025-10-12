`timescale 1ns / 1ps

module tb_traffic_light;

    // Parameters
    parameter int RED_DELAY = 4;
    parameter int RED_ORANGE_DELAY = 1;
    parameter int GREEN_DELAY = 6;
    parameter int ORANGE_DELAY = 1;
    parameter int COUNTER_WIDTH = 3;

    // Testbench signals
    logic clk, rstn, red, orange, green;

    traffic_light #(
        .RED_DELAY(RED_DELAY),
        .RED_ORANGE_DELAY(RED_ORANGE_DELAY),
        .GREEN_DELAY(GREEN_DELAY),
        .ORANGE_DELAY(ORANGE_DELAY),
        .COUNTER_WIDTH(COUNTER_WIDTH)
    ) uut (
        .clk(clk),
        .rstn(rstn),
        .red(red),
        .orange(orange),
        .green(green)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Frequency = 100MHz
    end

    initial begin
        // Initialize reset
        rstn = 0;
        #15;
        rstn = 1;

        // Observe multiple cycles
        #100;
        $stop; // End simulation
    end

endmodule