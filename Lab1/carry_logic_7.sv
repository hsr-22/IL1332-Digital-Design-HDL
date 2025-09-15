`timescale 1ns / 1ps

module carry_logic_7 (
    input  logic p0,
    p1,
    p2,
    p3,
    p4,
    p5,
    p6,
    p7,
    input  logic g0,
    g1,
    g2,
    g3,
    g4,
    g5,
    g6,
    g7,
    input  logic ci0,
    output logic co
);
  logic
      nand1_out,
      nand2_out,
      nand3_out,
      nand4_out,
      nand5_out,
      nand6_out,
      nand7_out,
      nand8_out,
      nand9_out;


  nand9_delay u1 (
      .a(p0),
      .b(p1),
      .c(p2),
      .d(p3),
      .e(p4),
      .f(p5),
      .g(p6),
      .h(p7),
      .i(ci0),
      .y(nand9_out)
  );
  nand8_delay u2 (
      .a(p1),
      .b(p2),
      .c(p3),
      .d(p4),
      .e(p5),
      .f(p6),
      .g(p7),
      .h(g0),
      .y(nand8_out)
  );
  nand7_delay u3 (
      .a(p2),
      .b(p3),
      .c(p4),
      .d(p5),
      .e(p6),
      .f(p7),
      .g(g1),
      .y(nand7_out)
  );
  nand6_delay u4 (
      .a(p3),
      .b(p4),
      .c(p5),
      .d(p6),
      .e(p7),
      .f(g2),
      .y(nand6_out)
  );
  nand5_delay u5 (
      .a(p4),
      .b(p5),
      .c(p6),
      .d(p7),
      .e(g3),
      .y(nand5_out)
  );
  nand4_delay u6 (
      .a(p5),
      .b(p6),
      .c(p7),
      .d(g4),
      .y(nand4_out)
  );
  nand3_delay u7 (
      .a(p6),
      .b(p7),
      .c(g5),
      .y(nand3_out)
  );
  nand2_delay u8 (
      .a(p7),
      .b(g6),
      .y(nand2_out)
  );
  nand2_delay u9 (
      .a(g7),
      .b(g7),
      .y(nand1_out)
  );

  nand9_delay u_or (
      .a(nand1_out),
      .b(nand2_out),
      .c(nand3_out),
      .d(nand4_out),
      .e(nand5_out),
      .f(nand6_out),
      .g(nand7_out),
      .h(nand8_out),
      .i(nand9_out),
      .y(co)
  );
endmodule

