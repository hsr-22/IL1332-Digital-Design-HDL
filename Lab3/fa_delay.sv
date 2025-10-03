module fa (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
);
// Intermediate signals
logic sum1, carry1, carry2;

// Instantiate the first half adder
ha HA1 (a, b, sum1, carry1);

// Instantiate the second half adder
ha HA2 (sum1, cin, sum, carry2);

// Instantiate the two-input NAND gate for the carry out
nand2 N2 (carry1, carry2, cout);

endmodule