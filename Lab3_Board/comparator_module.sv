module comparator_module (
    input logic [3:0] A,
    input logic [3:0] B,
    input logic [1:0] select,
    output logic [7:0] Y
);
    logic [7:0] gt, lt, eq, neq;
    logic g, l;

    // Instantiate the 4-bit comparator
    log_comparator_4bit u_comp (
        .A(A),
        .B(B),
        .g(g),
        .l(l)
    );

    assign gt = {6'b0, g, l};
    assign lt = {6'b0, g, l};

    // logic e;
    // assign e = (!g && !l);
    assign eq = {6'b0, g, l};
    assign neq = {6'b0, g||l, g||l};

    // Instantiate the 4-to-1 multiplexer
    mux4to1_N_bit #(8) u_mux (
        .A(gt),
        .B(lt),
        .C(eq),
        .D(neq),
        .sel(select),
        .Y(Y)
    );

endmodule