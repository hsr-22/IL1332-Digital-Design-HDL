`timescale 1ns / 1ps

module nand4_delay ( 
	input logic a,   // First input 
	input logic b,   // Second input 
    input logic c,   // third input 
    input logic d,   // fourth input 
	output logic y   // Output 
	); 

	// Continuous assignment for NAND gate 
    assign #1.5ns y = ~(a & b & c & d);  // Perform the NAND operation after the delay
	//assign y = ~(a & b & c & d);  // Perform the NAND operation after the delay
	
endmodule