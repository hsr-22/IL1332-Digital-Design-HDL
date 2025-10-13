module urbana_top_lock (
    output logic [15:0] LED,
    input  logic [15:0] SW,
    input  logic [3:0] BTN,
    input  logic CLK_100MHZ
    );

    // Specify which button to use for valid button
    assign valid_key_BTN = BTN[0];
    
    // Instantiate clock divider
    // 100MHz divided by 1MHz to make 100 Hz
    clock_divider #(
        .DIVISOR(1000000)
        ) clk_div_inst (
        .rst_n(~BTN[0]),
        .clk_in(CLK_100MHZ),
        .clk_out(divided_clk)
    );
    
    // Instantiate register
    register register_module (
        .d(valid_key_BTN),
        .clk(divided_clk),
        .rstn(~BTN[1]),
        .q(debounced_valid_key)
    );
    
    // Instantiate key press detector
    key_press_detector key_press_detector_module (
        .key(debounced_valid_key),
        .clk(CLK_100MHZ),
        .rstn(~BTN[1]),
        .key_pressed(valid_key)
     );
    
    // Instantiate the digital lock
    digital_lock digital_lock_module (
        .clk(CLK_100MHZ),
        .rstn(~BTN[1]),
        .key(SW[3:0]),
        .valid_key(valid_key),
        .state(LED[0])
    );
        
    
endmodule