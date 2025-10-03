module alu (
    input logic [7:0] x,
    input logic [7:0] y,
    input logic [1:0] m,
    input logic [1:0] s,
    output logic [15:0] z
);

    logic [15:0] arith_out, shiro_out, compa_out, logic_out;

	arithmetic_module u_arith (
			.A(x),
			.B(y),
			.select(m),
			.Y(arith_out)
	);

	shifter_rotator_module u_shiro (
			.X(x),
			.select(m),
			.Y(shiro_out)
	);
	
	comparator_module u_compa (
			.A(x),
			.B(y),
			.select(m),
			.Y(compa_out)
	);
	
	logic_module u_logic (
			.A(x),
			.B(y),
			.select(m),
			.Y(logic_out)
	);

	mux4to1_N_bit #(16) mux_final (
			.A(arith_out),
			.B(shiro_out),
			.C(compa_out),
			.D(logic_out),
			.sel(s),
			.Y(z)
	);

endmodule