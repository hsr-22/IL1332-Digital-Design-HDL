`timescale 1ns / 1ps

module CLA_8bit (
	input  logic [7:0] A,
	input  logic [7:0] B,
	output logic [8:0] Sum  // 9-bits to catch carry out
);

	logic [7:0] P, G;  // propagate & generate
	logic [8:0] C;  // carry signals

	assign C[0]= 1'b0;  // ingen extern carry in

	// Propagate
	genvar i;
	generate
		for (i = 0; i < 8; i++) begin : pl_block
		propogate_logic pl (
			.a(A[i]),
			.b(B[i]),
			.p(P[i])
		);
		end
	endgenerate

	// Generate
	genvar j;
	generate
		for (j = 0; j < 8; j++) begin : gl_block
		generate_logic gl (
			.a(A[j]),
			.b(B[j]),
			.g(G[j])
		);
		end
	endgenerate

	// Carry logic
	carry_logic_0 cl0 (
		.p0 (P[0]),
		.g0 (G[0]),
		.ci0(1'b0),
		.co (C[1])
	);
	carry_logic_1 cl1 (
		.p0 (P[0]),
		.g0 (G[0]),
		.p1 (P[1]),
		.g1 (G[1]),
		.ci0(1'b0),
		.co (C[2])
	);
	carry_logic_2 cl2 (
		.p0 (P[0]),
		.g0 (G[0]),
		.p1 (P[1]),
		.g1 (G[1]),
		.p2 (P[2]),
		.g2 (G[2]),
		.ci0(1'b0),
		.co (C[3])
	);
	carry_logic_3 cl3 (
		.p0 (P[0]),
		.g0 (G[0]),
		.p1 (P[1]),
		.g1 (G[1]),
		.p2 (P[2]),
		.g2 (G[2]),
		.p3 (P[3]),
		.g3 (G[3]),
		.ci0(1'b0),
		.co (C[4])
	);
	carry_logic_4 cl4 (
		.p0 (P[0]),
		.g0 (G[0]),
		.p1 (P[1]),
		.g1 (G[1]),
		.p2 (P[2]),
		.g2 (G[2]),
		.p3 (P[3]),
		.g3 (G[3]),
		.p4 (P[4]),
		.g4 (G[4]),
		.ci0(1'b0),
		.co (C[5])
	);
	carry_logic_5 cl5 (
		.p0 (P[0]),
		.g0 (G[0]),
		.p1 (P[1]),
		.g1 (G[1]),
		.p2 (P[2]),
		.g2 (G[2]),
		.p3 (P[3]),
		.g3 (G[3]),
		.p4 (P[4]),
		.g4 (G[4]),
		.p5 (P[5]),
		.g5 (G[5]),
		.ci0(1'b0),
		.co (C[6])
	);
	carry_logic_6 cl6 (
		.p0 (P[0]),
		.g0 (G[0]),
		.p1 (P[1]),
		.g1 (G[1]),
		.p2 (P[2]),
		.g2 (G[2]),
		.p3 (P[3]),
		.g3 (G[3]),
		.p4 (P[4]),
		.g4 (G[4]),
		.p5 (P[5]),
		.g5 (G[5]),
		.p6 (P[6]),
		.g6 (G[6]),
		.ci0(1'b0),
		.co (C[7])
	);
	carry_logic_7 cl7 (
		.p0 (P[0]),
		.g0 (G[0]),
		.p1 (P[1]),
		.g1 (G[1]),
		.p2 (P[2]),
		.g2 (G[2]),
		.p3 (P[3]),
		.g3 (G[3]),
		.p4 (P[4]),
		.g4 (G[4]),
		.p5 (P[5]),
		.g5 (G[5]),
		.p6 (P[6]),
		.g6 (G[6]),
		.p7 (P[7]),
		.g7 (G[7]),
		.ci0(1'b0),
		.co (C[8])
	);

	// Sum
	genvar k;
	generate
		for (k = 0; k < 8; k++) begin : sl_block
		sum_logic sl (
			.a  (A[k]),
			.b  (B[k]),
			.Cin(C[k]),
			.s  (Sum[k])
		);
		end
	endgenerate

	// Sign extension for the 9th bit
	sum_logic sl_8 (
		.a  (A[7]), // sign extension
		.b  (B[7]), // sign extension
		.Cin(C[8]), // carry out from the eighth slice
		.s  (Sum[8]) // sign extended 9th sum bit
	);

endmodule