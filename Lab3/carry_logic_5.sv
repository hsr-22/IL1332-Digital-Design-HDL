`timescale 1ns / 1ps

module carry_logic_5 (
    input  logic p0,
    p1,
    p2,
    p3,
    p4,
    p5,
    input  logic g0,
    g1,
    g2,
    g3,
    g4,
    g5,
    input  logic ci0,
    output logic co
);
  logic nand1_out, nand2_out, nand3_out, nand4_out, nand5_out, nand6_out, nand7_out;




  nand7 u1 (
      .a(p0),
      .b(p1),
      .c(p2),
      .d(p3),
      .e(p4),
      .f(p5),
      .g(ci0),
      .y(nand7_out)
  ); 
  nand6 u2 (
      .a(p1),
      .b(p2),
      .c(p3),
      .d(p4),
      .e(p5),
      .f(g0),
      .y(nand6_out)
  );  
  nand5 u3 (
      .a(p2),
      .b(p3),
      .c(p4),
      .d(p5),
      .e(g1),
      .y(nand5_out)
  );  
  nand4 u4 (
      .a(p3),
      .b(p4),
      .c(p5),
      .d(g2),
      .y(nand4_out)
  );  
  nand3 u5 (
      .a(p4),
      .b(p5),
      .c(g3),
      .y(nand3_out)
  );  
  nand2 u6 (
      .a(p5),
      .b(g4),
      .y(nand2_out)
  );
  nand2 u7 (
      .a(g5),
      .b(g5),
      .y(nand1_out)
  );  

 
  nand7 u_or (
      .a(nand1_out),
      .b(nand2_out),
      .c(nand3_out),
      .d(nand4_out),
      .e(nand5_out),
      .f(nand6_out),
      .g(nand7_out),
      .y(co)
  );
endmodule

