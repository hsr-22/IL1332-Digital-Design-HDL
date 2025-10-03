`timescale 1ns / 1ps

module nand7 ( 
    input  logic a, b, c, d, e, f, g,
    output logic y
);

    logic u1_out, u1_out_inv;
    logic u2_out, u2_out_inv;

    
    nand4 u1 (.a(a), .b(b), .c(c), .d(d), .y(u1_out));
    nand2 u1_inv (.a(u1_out), .b(u1_out), .y(u1_out_inv));

    
    nand3 u2 (.a(e), .b(f), .c(g), .y(u2_out));
    nand2 u2_inv (.a(u2_out), .b(u2_out), .y(u2_out_inv));

    
    nand2 u3 (.a(u1_out_inv), .b(u2_out_inv), .y(y));

endmodule

