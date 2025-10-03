module log_comparator_4bit (
    input  logic [3:0] A,
    input  logic [3:0] B,
    output logic       g,
    output logic       l
);

    logic g0, g1, g2;
    logic l0, l1, l2;

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
        .a0(g0),
        .b0(l0),
        .a1(g1),
        .b1(l1),
        .g(g),
        .l(l)
    );

    // logic [3:0] g_stage [0:2];
    // logic [3:0] l_stage [0:2];

    // // Initial stage connections
    // assign g_stage[0][0] = A[3];
    // assign g_stage[0][1] = A[2];
    // assign g_stage[0][2] = A[1];
    // assign g_stage[0][3] = A[0];

    // assign l_stage[0][0] = B[3];
    // assign l_stage[0][1] = B[2];
    // assign l_stage[0][2] = B[1];
    // assign l_stage[0][3] = B[0];

    // // Stage 1
    // comparator_slice u_comp0 (
    //     .a0(g_stage[0][0]),
    //     .b0(l_stage[0][0]),
    //     .a1(g_stage[0][1]),
    //     .b1(l_stage[0][1]),
    //     .g(g_stage[1][0]),
    //     .l(l_stage[1][0])
    // );

    // comparator_slice u_comp1 (
    //     .a0(g_stage[0][2]),
    //     .b0(l_stage[0][2]),
    //     .a1(g_stage[0][3]),
    //     .b1(l_stage[0][3]),
    //     .g(g_stage[1][1]),
    //     .l(l_stage[1][1])
    // );

    // // Stage 2
    // comparator_slice u_comp2 (
    //     .a0(g_stage[1][0]),
    //     .b0(l_stage[1][0]),
    //     .a1(g_stage[1][1]),
    //     .b1(l_stage[1][1]),
    //     .g(g_stage[2][0]),
    //     .l(l_stage[2][0])
    // );

    // assign g = g_stage[2][0];
    // assign l = l_stage[2][0];

endmodule