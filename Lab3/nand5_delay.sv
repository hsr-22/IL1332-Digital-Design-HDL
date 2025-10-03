module nand5 ( 
	input logic a,   // First input 
	input logic b,   // Second input 
    input logic c,   // third input 
    input logic d,   // fourth input 
    input logic e,   // fifth input 
	output logic y   // Output 
	); 

    logic u1_out, u1_out_inv;
    logic u2_out, u2_out_inv;


    nand3 u1 (.a(a), .b(b), .c(c), .y(u1_out));
    nand2 u1_inv (.a(u1_out), .b(u1_out), .y(u1_out_inv));

	nand2 u2 (.a(d), .b(e), .y(u2_out));
    nand2 u2_inv (.a(u2_out), .b(u2_out), .y(u2_out_inv));

    nand2 u3 (.a(u1_out_inv), .b(u2_out_inv), .y(y));

endmodule