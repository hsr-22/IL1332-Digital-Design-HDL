module mult_mnbit_signed #(parameter M = 4, parameter N = 4) (
    input  logic signed [M-1:0] A,
    input  logic signed [N-1:0] B,
    output logic signed [M+N-1:0] Prod
);

    // Convert to unsigned for processing
    logic [M-1:0] a_mag, a_abs;
    logic [N-1:0] b_mag, b_abs;
    logic a_sign, b_sign, result_sign;
    
    // Extract signs
    assign a_sign = A[M-1];
    assign b_sign = B[N-1];
    assign result_sign = a_sign ^ b_sign;
    
    // Get absolute values
    assign a_abs = a_sign ? (~A + 1'b1) : A;
    assign b_abs = b_sign ? (~B + 1'b1) : B;
    
    // Unsigned multiplication
    logic [M+N-1:0] unsigned_prod;
    mult_mnbit #(M, N) u_mult_unsigned (
        .A(a_abs),
        .B(b_abs),
        .Prod(unsigned_prod)
    );
    
    // Apply sign to result
    assign Prod = result_sign ? (~unsigned_prod + 1'b1) : unsigned_prod;
    
endmodule