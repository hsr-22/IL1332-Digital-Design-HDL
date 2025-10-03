module rca_4bit_unsigned (
    input  logic [3:0] a,  // 4-bit input A
    input  logic [3:0] b,  // 4-bit input B
    output logic [4:0] sum // 5-bit sum output (including carry-out as the fifth bit)
);
    // Internal wires for carries
    logic c1, c2, c3, c4;
    
    // Full Adder instances
    full_adder_structural_half_adder_nand fa0 (.a(a[0]), .b(b[0]), .cin(1'b0), .sum(sum[0]), .cout(c1));
    full_adder_structural_half_adder_nand fa1 (.a(a[1]), .b(b[1]), .cin(c1), .sum(sum[1]), .cout(c2));
    full_adder_structural_half_adder_nand fa2 (.a(a[2]), .b(b[2]), .cin(c2), .sum(sum[2]), .cout(c3));
    full_adder_structural_half_adder_nand fa3 (.a(a[3]), .b(b[3]), .cin(c3), .sum(sum[3]), .cout(c4));
    
    // Assign the final carry-out to the fifth bit of the sum
    assign sum[4] = c4;
    
endmodule