module and2 ( 
	input logic a,   // First input 
	input logic b,   // Second input 
	output logic y   // Output 
	); 

    logic u1_out;

    nand2 u1 (.a(a), .b(b), .y(u1_out));

    nand2 u2 (.a(u1_out), .b(u1_out), .y(y));

endmodule