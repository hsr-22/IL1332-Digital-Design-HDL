module arithmetic_module (
    input logic [3:0] A,
    input logic [3:0] B,
    input logic [1:0] select,
    output logic [7:0] Y
);

    logic [7:0] sum, diff, prod, quot;

    // Instantiate the arithmetic operations
    CLA_8bit u_add (
        .A({4'b0, A}),
        .B({4'b0, B}),
        .Sum(sum[8:0])
    );

    CLA_8bit u_sub (
        .A({4'b0, A}),
        .B({4'b0, ~B + 1}), // Two's complement for subtraction
        .Sum(diff[8:0])
    );

    // Sign extend the results to 16 bits based on the MSB
    //assign sum[15:9] = {7{sum[8]}};
    //assign diff[15:9] = {7{diff[8]}};

    mult_mnbit #(4, 4) u_mult (
        .A(A),
        .B(B),
        .Prod(prod[7:0])
    );

    // Multiplexer to select the output based on the select signal
    mux4to1_N_bit #(8) mux_final (
        .A(sum),
        .B(diff),
        .C(prod),
        .D(8'b0), // Zero (Unused Function)
        .sel(select),
        .Y(Y)
    );
    
endmodule