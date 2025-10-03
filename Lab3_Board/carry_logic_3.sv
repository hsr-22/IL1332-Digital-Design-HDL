module carry_logic_3 (
    input logic p0,
    input logic g0,
    input logic p1,
    input logic g1,
    input logic p2,
    input logic g2,
    input logic p3,
    input logic g3,
    input logic ci0,
    output logic co
);

    logic nand1_out;  
    logic nand2_out;  
    logic nand3_out;  
    logic nand4_out;  
    logic nand5_out;  


// co3  = g3  + p3 g2  + p3 p2 g1  + p3 p2 p1 g0  + p3 p2 p1 p0 ci0


nand5 u1 (
	.a(p0), 
	.b(p1), 
    .c(p2),
    .d(p3),
    .e(ci0),
	.y(nand1_out)
	); 

nand4 u2 (
	.a(p1), 
	.b(p2), 
    .c(p3),
    .d(g0),
	.y(nand2_out)
	); 

nand3 u3 (
	.a(p3), 
	.b(p2), 
    .c(g1),
	.y(nand3_out)
	); 

nand2 u4 (
	.a(p3), 
	.b(g2), 
	.y(nand4_out)
	); 

nand2 u5 (
	.a(g3), 
	.b(g3), 
	.y(nand5_out)
	); 

nand5 u6 (
	.a(nand1_out), 
	.b(nand2_out), 
    .c(nand3_out), 
    .d(nand4_out),
    .e(nand5_out),
	.y(co)
	); 

endmodule
