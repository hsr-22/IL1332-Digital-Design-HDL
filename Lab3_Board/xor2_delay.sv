module xor2 (
    input  logic a,  // First input 
    input  logic b,  // Second input 
    output logic y   // Output 
);

  logic u1_out, u2_out, u3_out;

  nand2 u1 (
      .a(a),
      .b(b),
      .y(u1_out)
  );

  nand2 u2 (
      .a(a),
      .b(u1_out),
      .y(u2_out)
  );

  nand2 u3 (
      .a(b),
      .b(u1_out),
      .y(u3_out)
  );

  nand2 u4 (
      .a(u2_out),
      .b(u3_out),
      .y(y)
  );

endmodule
