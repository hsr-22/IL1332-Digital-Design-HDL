module urbana_top (
    output logic [2:0] RGB0,
    output logic [2:0] RGB1,
    input  logic [3:0] BTN,
    input  logic CLK_100MHZ
);

    // Instantiate clock divider
    clock_divider #(
        .DIVISOR(10000000) // Divide 100MHz to 10Hz
    ) clk_div_inst (
        .clk_in(CLK_100MHZ),
        .rst_n(~BTN[0]),
        .clk_out(clk)
    );

    // Parameters for traffic light timing

    parameter int RED_DELAY = 4;
    parameter int RED_ORANGE_DELAY = 1;
    parameter int GREEN_DELAY = 6;
    parameter int ORANGE_DELAY = 1;
    parameter int COUNTER_WIDTH = 3;

    //instantiate traffic lights
    traffic_light #(
        .RED_DELAY(RED_DELAY),
        .RED_ORANGE_DELAY(RED_ORANGE_DELAY),
        .GREEN_DELAY(GREEN_DELAY),
        .ORANGE_DELAY(ORANGE_DELAY),
        .COUNTER_WIDTH(COUNTER_WIDTH)
    ) traffic_light_0 (
        .clk(clk),
        .rstn(~BTN[0]),
        .red(RGB0[0]),
        .orange(RGB0[2]),
        .green(RGB0[1])
    );
endmodule