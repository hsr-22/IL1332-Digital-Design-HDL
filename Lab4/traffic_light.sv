module traffic_light  #(
    parameter int RED_DELAY = 4,           // Duration of Red state
    parameter int RED_ORANGE_DELAY = 1,    // Duration of RedOrange state
    parameter int GREEN_DELAY = 6,         // Duration of Green state
    parameter int ORANGE_DELAY = 1,        // Duration of Orange state
    parameter int COUNTER_WIDTH = 3
) (
    input  logic clk,
    input  logic rstn,
    output logic red,
    output logic orange,
    output logic green
);

    // State Encoding
    typedef enum logic [1:0] {
        RED = 2'b00,
        RED_ORANGE = 2'b01,
        GREEN = 2'b10,
        ORANGE = 2'b11
    } state_ty;

    state_ty pres_state, next_state;
    
    logic [COUNTER_WIDTH-1:0] counter;
    
    // State Register Process (Sequential Logic)
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            pres_state <= RED; // Initial state
            counter <= RED_DELAY;
        end else begin
            if (counter == 0) begin
                pres_state <= next_state; // Update state
                case (next_state)
                    RED: counter <= RED_DELAY;
                    RED_ORANGE: counter <= RED_ORANGE_DELAY;
                    GREEN: counter <= GREEN_DELAY;
                    ORANGE: counter <= ORANGE_DELAY;
                endcase
            end 
            else begin
                counter <= counter - 1;
            end
        end
    end

    // Combinational Logic for Next-State
    always_comb begin
        next_state = pres_state;
        red = 1'b0;
        orange = 1'b0;
        green = 1'b0;

        case (pres_state)
            RED: begin
                red = 1'b1;
                next_state = RED_ORANGE;
            end
            
            RED_ORANGE: begin
                red = 1'b1;
                orange = 1'b1;
                next_state = GREEN;
            end

            GREEN: begin
                green = 1'b1;
                next_state = ORANGE;
            end
            
            ORANGE: begin
                orange = 1'b1;
                next_state = RED;
            end
            
            default: begin
                next_state = RED;
            end
        endcase
    end

endmodule
