
`timescale 1ns / 1ps

module nand2 ( 
	input logic a,   // First input 
	input logic b,   // Second input 
	output logic y   // Output 
	); 

// Continuous assignment for XOR gate 
    assign  y = ~(a & b);  // Perform the XOR operation after the delay
	
endmodule