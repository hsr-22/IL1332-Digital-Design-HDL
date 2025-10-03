module arithmetic_module (
    input logic [7:0] A,
    input logic [7:0] B,
    input logic [1:0] select,
    output logic [15:0] Y
);

    logic [15:0] sum, diff, prod, quot;

    // Instantiate the arithmetic operations
    CLA_8bit u_add (
        .A(A),
        .B(B),
        .Sum(sum[8:0])
    );

    CLA_8bit u_sub (
        .A(A),
        .B(~B + 1), // Two's complement for subtraction
        .Sum(diff[8:0])
    );

    // Sign extend the results to 16 bits based on the MSB
    assign sum[15:9] = {7{sum[8]}};
    assign diff[15:9] = {7{diff[8]}};

    mult_mnbit #(8, 8) u_mult (
        .A(A),
        .B(B),
        .Prod(prod[15:0])
    );

    // Multiplexer to select the output based on the select signal
    mux4to1_N_bit #(16) mux_final (
        .A(sum),
        .B(diff),
        .C(prod),
        .D(16'b0), // Zero (Unused Function)
        .sel(select),
        .Y(Y)
    );
    
endmodule