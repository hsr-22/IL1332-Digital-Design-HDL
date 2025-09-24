module shifter_rotator( 
    input logic[3:0] x, 
    input logic[1:0] select, 
    output logic[3:0] y 
); 

    mux4to1_slice u1 (
		.a(1'b0),
		.b(x[1]),
		.c(x[3]),
		.d(x[1]),
		.s(select),
		.y(y[0])
	);
	mux4to1_slice u2 (
		.a(x[0]),
		.b(x[2]),
		.c(x[0]),
		.d(x[2]),
		.s(select),
		.y(y[1])
	);
	mux4to1_slice u3 (
		.a(x[1]),
		.b(x[3]),
		.c(x[1]),
		.d(x[3]),
		.s(select),
		.y(y[2])
	);
	mux4to1_slice u4 (
		.a(x[2]),
		.b(1'b0),
		.c(x[2]),
		.d(x[0]),
		.s(select),
		.y(y[3])
	);	

endmodule