module digital_lock (
    input  logic clk,
    input  logic rstn,
    input  logic [3:0] key,
    input  logic valid_key,
    output logic state
);

    parameter logic [15:0] DEFAULT_PIN = 16'h1234; // Default PIN = 1234

    // State Encoding
    typedef enum logic [1:0] {
        UNLOCK = 2'b00,
        LOCK = 2'b01,
        CHANGE = 2'b10
    } state_ty;

    state_ty pres_state, next_state;

    logic [15:0] entered_pin;
	logic [15:0] previous_pin;
    logic [15:0] correct_pin;
    logic [2:0] counter;

    // helper: whether current key is a control key
    logic is_ctrl_B, is_ctrl_C, is_ctrl_E;
    assign is_ctrl_B = (key == 4'hB); // 'B' key to lock
    assign is_ctrl_C = (key == 4'hC); // 'C' key to unlock
    assign is_ctrl_E = (key == 4'hE); // 'E' key to change PIN

    // State Register Process (Sequential Logic)
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            correct_pin <= DEFAULT_PIN;
            pres_state <= UNLOCK;
            entered_pin <= 16'b0;
            counter <= 3'b000;
		    previous_pin <= 16'b0;
        end 
        else begin
            pres_state <= next_state;

            if (valid_key) begin
		        previous_pin <= entered_pin;
		        entered_pin <= {entered_pin[11:0], key}; // Shift left and add new digit
                case (pres_state)
                    CHANGE: begin
                        counter <= counter + 1;
                        
                        if (counter == 3'b011) begin
                            correct_pin <= {entered_pin[11:0], key};  // Update PIN after 4 digits
                        end
                    end
                    default: begin
                        counter <= 3'b000;
                    end
                endcase
            end
        end
    end

    // Combinational Logic for Next-State
    always_comb begin
        next_state = pres_state;
        state = (pres_state == LOCK) ? 1'b1 : 1'b0;

        case (pres_state)
            UNLOCK: begin
                if (valid_key && is_ctrl_B) begin
                    next_state = LOCK;
                end 
                else if (valid_key && is_ctrl_E) begin
                    next_state = CHANGE;
                end
            end

		    LOCK: begin
    			if (valid_key && is_ctrl_C) begin
                    if (entered_pin == correct_pin) begin
                        next_state = UNLOCK;
                    end 
                    else begin
                        next_state = LOCK;
                    end
                end
            end
   
            CHANGE: begin
                if (counter == 3'b100) begin
                    next_state = UNLOCK;
                end
            end

            default: next_state = UNLOCK; // Fallback to UNLOCK state
        endcase
    end

endmodule
