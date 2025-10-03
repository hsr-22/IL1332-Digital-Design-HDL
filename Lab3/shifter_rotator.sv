module shifter_rotator( 
	input logic[7:0] x, 
	input logic[1:0] select, 
	output logic[7:0] y 
); 

	mux4to1_slice u1 (
		.a(x[1]),  // Rotate right
		.b(x[7]),  // Rotate left
		.c(x[1]),  // Shift left
		.d(1'b0),  // Shift right
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
		.a(x[4]),
		.b(x[2]),
		.c(x[4]),
		.d(x[2]),
		.s(select),
		.y(y[3])
	);
	mux4to1_slice u5 (
		.a(x[5]),
		.b(x[3]),
		.c(x[5]),
		.d(x[3]),
		.s(select),
		.y(y[4])
	);
	mux4to1_slice u6 (
		.a(x[6]),
		.b(x[4]),
		.c(x[6]),
		.d(x[4]),
		.s(select),
		.y(y[5])
	);
	mux4to1_slice u7 (
		.a(x[7]),
		.b(x[5]),
		.c(x[7]),
		.d(x[5]),
		.s(select),
		.y(y[6])
	);
	mux4to1_slice u8 (
		.a(x[0]),
		.b(x[6]),
		.c(1'b0),
		.d(x[6]),
		.s(select),
		.y(y[7])
	);

endmodule