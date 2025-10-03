module shifter_rotator( 
	input logic[3:0] x, 
	input logic[1:0] select, 
	output logic[3:0] y 
); 

	mux4to1_slice u1 (
		.a(x[1]),  // Rotate right
		.b(x[3]),  // Rotate left
		.c(x[1]),  // Shift right
		.d(1'b0),  // Shift left
		.s(select),
		.y(y[0])
	);
	mux4to1_slice u2 (
		.a(x[2]),
		.b(x[0]),
		.c(x[2]),
		.d(x[0]),
		.s(select),
		.y(y[1])
	);
	mux4to1_slice u3 (
		.a(x[3]),
		.b(x[1]),
		.c(x[3]),
		.d(x[1]),
		.s(select),
		.y(y[2])
	);
	mux4to1_slice u4 (
		.a(x[0]),
		.b(x[2]),
		.c(1'b0),
		.d(x[2]),
		.s(select),
		.y(y[3])
	);

endmodule