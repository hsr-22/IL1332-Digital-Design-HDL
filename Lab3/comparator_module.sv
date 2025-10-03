module comparator_module (
    input logic [7:0] A,
    input logic [7:0] B,
    input logic [1:0] select,
    output logic [15:0] Y
);
    logic [15:0] gt, lt, eq, neq;
    logic g, l;

    // Instantiate the 8-bit comparator
    log_comparator_8bit u_comp (
        .A(A),
        .B(B),
        .g(g),
        .l(l)
    );

    assign gt = {14'b0, g, l};
    assign lt = {14'b0, g, l};

    // logic e;
    // assign e = (!g && !l);
    assign eq = {14'b0, g, l};
    assign neq = {14'b0, g||l, g||l};

    // Instantiate the 4-to-1 multiplexer
    mux4to1_N_bit #(16) u_mux (
        .A(gt),
        .B(lt),
        .C(eq),
        .D(neq),
        .sel(select),
        .Y(Y)
    );

endmodule