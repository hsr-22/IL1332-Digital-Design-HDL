module sum_logic (
    input logic a,
    input logic b,
    input logic Cin,
    output logic s
);

    logic xor1_out;  

xor2 u1 (
	.a(a), 
	.b(b), 
	.y(xor1_out)
	); 

xor2 u2 (
	.a(xor1_out), 
	.b(Cin), 
	.y(s)
	); 

endmodule
