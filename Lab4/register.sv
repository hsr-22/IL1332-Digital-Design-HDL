module register (
    input  logic clk,
    input  logic rstn,
    input  logic d,
    output logic q
);

    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            q <= 1'b0;
        end else begin
            q <= d;
        end
    end

endmodule