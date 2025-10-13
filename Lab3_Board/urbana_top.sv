module urbana_top (
    output logic [15:0] LED,
    input  logic [15:0] SW
);
    
    logic [3:0] X, Y;
    logic [1:0] M, S;
    logic [7:0] Z;

    // Input X
    assign LED[15] = SW[15];
    assign X[3] = SW[15];
    
    assign LED[14] = SW[14];
    assign X[2] = SW[14];
    
    assign LED[13] = SW[13];
    assign X[1] = SW[13];
    
    assign LED[12] = SW[12];
    assign X[0] = SW[12];    
    
    // Input Y
    assign LED[11] = SW[11];
    assign Y[3] = SW[11];
    
    assign LED[10] = SW[10];
    assign Y[2] = SW[10];
    
    assign LED[9] = SW[9];
    assign Y[1] = SW[9];
    
    assign LED[8] = SW[8];
    assign Y[0] = SW[8];
    
    // Control M and S
    assign M[1] = SW[1];
    assign M[0] = SW[0];
    
    assign S[1] = SW[3];
    assign S[0] = SW[2];
    
    alu u_alu (
        .x(X),
        .y(Y),
        .m(M),
        .s(S),
        .z(Z)
    );
    
    assign LED[7:0] = Z[7:0];

endmodule