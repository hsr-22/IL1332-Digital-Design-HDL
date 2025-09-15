module carry_logic_1 (
    input logic p0,
    input logic g0,
	input logic p1,
    input logic g1,
    input logic ci0,
    output logic co
);

    logic nand1_out;  
    logic nand2_out;  
	logic nand3_out;  


nand3_delay u1 (
	.a(p0), 
	.b(p1), 
	.c(ci0),
	.y(nand1_out)
	); 

nand2_delay u2 (
	.a(p1), 
	.b(g0), 
	.y(nand2_out)
	); 

nand2_delay u3 (
	.a(g1), 
	.b(g1), 
	.y(nand3_out)
	); 

nand3_delay u4 (
	.a(nand1_out), 
	.b(nand2_out), 
	.c(nand3_out),
	.y(co)
	); 
//co = g1 | p1 & g0 | (p1 & p0 & ci0;
endmodule