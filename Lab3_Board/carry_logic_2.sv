module carry_logic_2 (
    input logic p0,
    input logic g0,
    input logic p1,
    input logic g1,
    input logic p2,
    input logic g2,
    input logic ci0,
    output logic co
);

    logic nand1_out;  
    logic nand2_out;  
    logic nand3_out;  
    logic nand4_out;  


// co2  = g2  + p2 g1  + p2 p1 g0  + p2 p1 p0 ci0

nand4 u1 (
	.a(p0), 
	.b(p1), 
    .c(p2),
    .d(ci0),
	.y(nand1_out)
	); 

nand3 u2 (
	.a(p2), 
	.b(p1), 
    .c(g0),
	.y(nand2_out)
	); 

nand2 u3 (
	.a(p2), 
	.b(g1), 
	.y(nand3_out)
	); 

nand2 u4 (
	.a(g2), 
	.b(g2), 
	.y(nand4_out)
	); 

nand4 u5 (
	.a(nand1_out), 
	.b(nand2_out), 
    .c(nand3_out), 
    .d(nand4_out),
	.y(co)
	); 

endmodule