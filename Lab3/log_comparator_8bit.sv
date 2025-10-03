module log_comparator_8bit (
    input  logic [7:0] A,
    input  logic [7:0] B,
    output logic       g,
    output logic       l
);

    logic g0, g1, g2, g3;
    logic l0, l1, l2, l3;

    // First stage: Compare 2 bits at a time
    comparator_slice u_comp0 (
        .a0(A[0]),
        .b0(B[0]),
        .a1(A[1]),
        .b1(B[1]),
        .g(g0),
        .l(l0)
    );

    comparator_slice u_comp1 (
        .a0(A[2]),
        .b0(B[2]),
        .a1(A[3]),
        .b1(B[3]),
        .g(g1),
        .l(l1)
    );

    comparator_slice u_comp2 (
        .a0(A[4]),
        .b0(B[4]),
        .a1(A[5]),
        .b1(B[5]),
        .g(g2),
        .l(l2)
    );

    comparator_slice u_comp3 (
        .a0(A[6]),
        .b0(B[6]),
        .a1(A[7]),
        .b1(B[7]),
        .g(g3),
        .l(l3)
    );

    // Second stage: Combine results from the first stage
    logic g4, l4;

    comparator_slice u_comp4 (
        .a0(g0),
        .b0(l0),
        .a1(g1),
        .b1(l1),
        .g(g4),
        .l(l4)
    );

    logic g5, l5;

    comparator_slice u_comp5 (
        .a0(g2),
        .b0(l2),
        .a1(g3),
        .b1(l3),
        .g(g5),
        .l(l5)
    );

    // Final stage: Combine results from the second stage
    comparator_slice u_comp6 (
        .a0(g4),
        .b0(l4),
        .a1(g5),
        .b1(l5),
        .g(g),
        .l(l)
    );

endmodule
