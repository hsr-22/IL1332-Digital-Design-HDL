module key_press_detector (
    input  logic clk,
    input  logic rstn,
    input  logic key,
    output logic key_pressed
);

    // State Encoding
    typedef enum logic {
        RELEASED = 1'b0,
        PRESSED = 1'b1
    } state_ty;

    state_ty pres_state, next_state;

    // State Register Process (Sequential Logic)
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            pres_state <= RELEASED; // Initial state
            key_pressed <= 1'b0;
        end else begin
            pres_state <= next_state; // Update state

            if (pres_state == RELEASED && next_state == PRESSED) begin
                key_pressed <= 1'b1; // Key press detected
            end else begin
                key_pressed <= 1'b0; // No key press
            end
        end
    end

    // Next State Logic
    always_comb begin
        next_state = pres_state; // Default to hold state

        case (pres_state)
            RELEASED: begin
                if (key) begin
                    next_state = PRESSED;
                end else begin
                    next_state = RELEASED;
                end
            end
            PRESSED: begin
                if (!key) begin
                    next_state = RELEASED;
                end else begin
                    next_state = PRESSED;
                end
            end
        endcase
    end

endmodule