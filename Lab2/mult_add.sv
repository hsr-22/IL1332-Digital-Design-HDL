module mult_add (
    input logic [3:0] a0,
    input logic [3:0] a1,
    input logic [3:0] a2,
    input logic [3:0] a3,
    input logic [3:0] a4,
    input logic [3:0] a5,
    input logic [3:0] a6,
    input logic [3:0] a7,
    output logic [9:0] x // Maximum width of the result
);

    logic [7:0] mult1, mult2, mult3, mult4;
	logic [8:0] sumo1, sumo2;
	
    // Instantiate 4x4 multipliers
	mult_mnbit #(4, 4) u1 (
		.A(a0),
		.B(a1),
		.Prod(mult1)
	);

	mult_mnbit #(4, 4) u2 (
		.A(a2),
		.B(a3),
		.Prod(mult2)
	);

	mult_mnbit #(4, 4) u3 (
		.A(a4),
		.B(a5),
		.Prod(mult3)
	);

	mult_mnbit #(4, 4) u4 (
		.A(a6),
		.B(a7),
		.Prod(mult4)
	);

    // Addition of 8-bit + 8-bit = 9-bit
	rca_Nbit_delay #(8) u5 ( 
                    .A(mult1),
                    .B(mult2),
                    .cin(1'b0),
                    .Sum(sumo1)
    );

	rca_Nbit_delay #(8) u6 ( 
                    .A(mult3),
                    .B(mult4),
                    .cin(1'b0),
                    .Sum(sumo2)
    );

    // Final addition of 9-bit + 9-bit = 10-bit
	rca_Nbit_delay #(9) u7 ( 
                    .A(sumo1),
                    .B(sumo2),
                    .cin(1'b0),
                    .Sum(x)
    );


endmodule