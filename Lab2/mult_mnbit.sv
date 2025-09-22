module mult_mnbit #(parameter M = 4, parameter N = 4) (
    input  logic [M-1:0] A,
    input  logic [N-1:0] B,
    output logic [M+N-1:0] Prod
    );

    logic [N-1:0][M-1:0] prod_terms;

    logic [M-1:0] A_int[N-2:0];
    logic [M-1:0] B_int[N-2:0];
    logic [M-1:0] Sum[N-2:0];
    logic [N-2:0] carry_out;

    // Generate block to create the product terms
    genvar i, j;
    generate
        for (i = 0; i < N; i++) begin : B_loop
            for (j = 0; j < M; j++) begin : A_loop
                and2_delay u_and (
                        .a(A[j]), 
                        .b(B[i]), 
                        .y(prod_terms[i][j])
                    );
            end
        end
    endgenerate

    assign A_int[0][M-1]     = 1'b0;
    assign A_int[0][M-2:0]   = prod_terms [0][M-1:1];
    assign Prod[0]           = prod_terms [0][0];
    assign B_int[0]          = prod_terms [1];
       
    rca_Nbit_co #(M) u1 ( 
        .A(A_int[0]),
        .B(B_int[0]),
        .cin(1'b0),
        .Sum(Sum[0]),
        .co(carry_out[0])
    );

    genvar k;
    generate
        for (k = 1; k < N-1; k++) begin : sum_loop
            assign A_int[k][M-1]      = carry_out[k-1];
            assign A_int[k][M-2:0]    = Sum[k-1][M-1:1];
            assign Prod[k]            = Sum[k-1][0];
            assign B_int[k]           = prod_terms [k+1];
           
           rca_Nbit_co #(M) u_rca ( 
                                    .A(A_int[k]),
                                    .B(B_int[k]),
                                    .cin(1'b0),
                                    .Sum(Sum[k]),
                                    .co(carry_out[k])
                                );
        end
    endgenerate

    assign Prod[M+N-2:N-1] = Sum[N-2];
    assign Prod[M+N-1]     = carry_out[N-2];

endmodule