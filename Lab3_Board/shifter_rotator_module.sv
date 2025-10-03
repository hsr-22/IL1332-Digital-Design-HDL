module shifter_rotator_module (
    input logic [3:0] X,
    input logic [1:0] select,
    output logic [7:0] Y
);

    shifter_rotator u_shiro (
        .x(X),
        .select(select),
        .y(Y[3:0])
    );

    assign Y[7:4] = 4'b0; // Zero-extend the output to 8 bits

endmodule