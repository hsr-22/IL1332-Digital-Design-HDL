module carry_logic_0 (
    input logic p0,
    input logic g0,
    input logic ci0,
    output logic co
);

    logic nand1_out;  
    logic nand2_out;  


nand2_delay u1 (
	.a(p0), 
	.b(ci0), 
	.y(nand1_out)
	); 

nand2_delay u2 (
	.a(g0), 
	.b(g0), 
	.y(nand2_out)
	); 

nand2_delay u3 (
	.a(nand1_out), 
	.b(nand2_out), 
	.y(co)
	); 

endmodule