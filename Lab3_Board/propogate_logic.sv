module propogate_logic (
    input logic a,
    input logic b,
    output logic p
);

    logic nand1_out;  
    logic nand2_out;  

nand2 u1 (
	.a(a), 
	.b(a), 
	.y(nand1_out)
	); 

nand2 u2 (
	.a(b), 
	.b(b), 
	.y(nand2_out)
	); 

nand2 u3 (
	.a(nand1_out), 
	.b(nand2_out), 
	.y(p)
	); 
endmodule
