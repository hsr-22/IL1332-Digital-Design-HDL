module generate_logic (
    input logic a,
    input logic b,
    output logic g
);

    logic nand_out;  


nand2_delay u1 (
	.a(a), 
	.b(b), 
	.y(nand_out)
	); 

nand2_delay u2 (
	.a(nand_out), 
	.b(nand_out), 
	.y(g)
	); 

endmodule
