module shifter_rotator_module (
    input logic [7:0] X,
    input logic [1:0] select,
    output logic [15:0] Y
);

    shifter_rotator u_shiro (
        .x(X),
        .select(select),
        .y(Y[7:0])
    );

    assign Y[15:8] = 8'b0; // Zero-extend the output to 16 bits
    
endmodule