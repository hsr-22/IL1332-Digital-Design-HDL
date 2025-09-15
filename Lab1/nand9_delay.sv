`timescale 1ns / 1ps

module nand9_delay ( 
    input  logic a, b, c, d, e, f, g, h, i,
    output logic y
);

    logic u1_out, u1_out_inv;
    logic u2_out, u2_out_inv;
    logic u3_out, u3_out_inv;

    
    nand4_delay u1 (.a(a), .b(b), .c(c), .d(d), .y(u1_out));
    nand2_delay u1_inv (.a(u1_out), .b(u1_out), .y(u1_out_inv));

    
    nand3_delay u2 (.a(e), .b(f), .c(g), .y(u2_out));
    nand2_delay u2_inv (.a(u2_out), .b(u2_out), .y(u2_out_inv));

    
    nand2_delay u3 (.a(h), .b(i), .y(u3_out));
    nand2_delay u3_inv (.a(u3_out), .b(u3_out), .y(u3_out_inv));

    
    nand3_delay u4 (.a(u1_out_inv), .b(u2_out_inv), .c(u3_out_inv), .y(y));

endmodule

