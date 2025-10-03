module logic_module (
    input logic [3:0] A,
    input logic [3:0] B,
    input logic [1:0] select,
    output logic [7:0] Y
);

    logic [7:0] and_out, or_out, not_out, xor_out;

    // Bitwise Operations
    assign and_out = {4'b0, A & B};
    assign or_out  = {4'b0, A | B};
    assign xor_out = {4'b0, A ^ B};

    assign not_out = {4'b0, ~A}; // NOT operation on A, zero-extended to 16 bits

    // Instantiate the 4-to-1 multiplexer
    mux4to1_N_bit #(8) u_mux (
        .A(and_out),
        .B(or_out),
        .C(not_out),
        .D(xor_out),
        .sel(select),
        .Y(Y)
    );

endmodule