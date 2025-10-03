module log_comparator_nbit #(parameter N = 4) (
    input  logic [N-1:0] A,
    input  logic [N-1:0] B,
    output logic         g,
    output logic         l
);

    localparam int log2N = $clog2(N);
    // function int log2(input int value);
    //     int i;
    //     begin
    //         log2 = 0;
    //         for (i = value; i > 1; i = i >> 1) begin
    //             log2 = log2 + 1;
    //         end
    //     end
    // endfunction

    // Initial stage connections
    // logic [log2N:0][N/(2**(log2N))-1:0] g_stage;
    // logic [log2N:0][N/(2**(log2N))-1:0] l_stage;
    
    // Wastage of space but easier to implement
    logic [N-1:0] g_stage [0:log2N];
    logic [N-1:0] l_stage [0:log2N];

    genvar k;
    generate
        for (k = 0; k < N; k++) begin : gen_initial_stage
            assign g_stage[0][k] = A[N-1-k];
            assign l_stage[0][k] = B[N-1-k];
        end
    endgenerate

    genvar i;
    generate
        for (i = 0; i < log2N; i++) begin : gen_stages
            genvar j;
            for (j = 0; j < (N >> (i+1)); j++) begin : gen_pairs
                comparator_slice u_comp (
                    .a0(g_stage[i][2*j]),
                    .b0(l_stage[i][2*j]),
                    .a1(g_stage[i][2*j+1]),
                    .b1(l_stage[i][2*j+1]),
                    .g(g_stage[i+1][j]),
                    .l(l_stage[i+1][j])
                );
            end
        end
    endgenerate

    assign g = g_stage[log2N][0];
    assign l = l_stage[log2N][0];

endmodule