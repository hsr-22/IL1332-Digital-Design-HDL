module rca_nbit_mux #(parameter N = 4) (
    input logic  [N-1:0] a,
    input logic  [N-1:0] b,
    input logic  cin,
    output logic [N-1:0] sum,
    output logic cout
);
    // Internal carry signals
    logic [N:0] C;

    assign C[0] = cin;
    
    // Generate block to create the N bit RCA
    genvar i;
    generate
        for (i = 0; i < N; i++) begin : gen_rca_mux
            mux_sum_slice u_sum (
                .a(a[i]),
                .b(b[i]),
                .cin(C[i]),
                .sum(sum[i])
            );
            
            mux_carry_slice u_carry (
                .a(a[i]),
                .b(b[i]),
                .cin(C[i]),
                .cout(C[i+1])
            );
        end
    endgenerate

    assign cout = C[N];

endmodule