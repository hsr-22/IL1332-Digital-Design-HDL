module mux_sum_slice (
	input logic a,
	input logic b,
	input logic cin,
	output logic sum
);

	logic muxo1, muxo2, muxo3, muxo4, muxo5, muxo6;
	logic o7, o6, o5, o4, o3, o2, o1, o0;

	assign o7 = 1'b1;
	assign o6 = 1'b0;
	assign o5 = 1'b0;
	assign o4 = 1'b1;
	assign o3 = 1'b0;
	assign o2 = 1'b1;
	assign o1 = 1'b1;
	assign o0 = 1'b0;

	mux2to1_slice u1 (.a(o7), .b(o3), .s(a), .y(muxo1));
	mux2to1_slice u2 (.a(o5), .b(o1), .s(a), .y(muxo2));
	mux2to1_slice u3 (.a(o6), .b(o2), .s(a), .y(muxo3));
	mux2to1_slice u4 (.a(o4), .b(o0), .s(a), .y(muxo4));

	mux2to1_slice u5 (.a(muxo1), .b(muxo2), .s(b), .y(muxo5));
	mux2to1_slice u6 (.a(muxo3), .b(muxo4), .s(b), .y(muxo6));

	mux2to1_slice u7 (.a(muxo5), .b(muxo6), .s(cin), .y(sum));
	
endmodule