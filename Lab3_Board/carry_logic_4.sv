`timescale 1ns / 1ps

module carry_logic_4 (
    input  logic p0,
    input  logic g0,
    input  logic p1,
    input  logic g1,
    input  logic p2,
    input  logic g2,
    input  logic p3,
    input  logic g3,
    input  logic p4,
    input  logic g4,
    input  logic ci0,
    output logic co
);

    logic nand1_out;  // ~(p0&p1&p2&p3&p4&ci0)
    logic nand2_out;  // ~(p1&p2&p3&p4&g0)
    logic nand3_out;  // ~(p2&p3&p4&g1)
    logic nand4_out;  // ~(p3&p4&g2)
    logic nand5_out;  // ~(p4&g3)
    logic nand6_out;  // ~(g4)

    // co4 = g4 + p4g3 + p4p3g2 + p4p3p2g1 + p4p3p2p1g0 + p4p3p2p1p0ci0

    // Term 6 (längsta): p4 p3 p2 p1 p0 ci0
    nand6 u1 (
        .a(p0), .b(p1), .c(p2), .d(p3), .e(p4), .f(ci0),
        .y(nand1_out)
    );

    // Term 5: p4 p3 p2 p1 g0
    nand5 u2 (
        .a(p1), .b(p2), .c(p3), .d(p4), .e(g0),
        .y(nand2_out)
    );

    // Term 4: p4 p3 p2 g1
    nand4 u3 (
        .a(p2), .b(p3), .c(p4), .d(g1),
        .y(nand3_out)
    );

    // Term 3: p4 p3 g2
    nand3 u4 (
        .a(p3), .b(p4), .c(g2),
        .y(nand4_out)
    );

    // Term 2: p4 g3
    nand2 u5 (
        .a(p4), .b(g3),
        .y(nand5_out)
    );

    // Term 1: g4  (self-NAND = invertering)
    nand2 u6 (
        .a(g4), .b(g4),
        .y(nand6_out)
    );

    // Sista steget: OR av alla produkter = NAND av alla negationer
    nand6 u_or (
        .a(nand1_out), .b(nand2_out), .c(nand3_out),
        .d(nand4_out), .e(nand5_out), .f(nand6_out),
        .y(co)
    );

endmodule
