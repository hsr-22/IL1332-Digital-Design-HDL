`timescale 1ns / 1ps

module tb_rca_nbit_mux;
    // Declare testbench variables
    parameter N = 4;
    logic signed [N-1:0] A, B;
    logic signed [N-1:0] sum_rca;
    logic cout;

    int x, y;

    // Instantiate the Device Under Test (DUT)
    rca_nbit_mux #(N) dut_rca (
        .a(A),
        .b(B),
	    .cin(1'b0),
        .sum(sum_rca),
        .cout(cout)
    );

    // Initial block to start the simulation
    initial begin
        $display("Starting Ripple Carry Adder Testbench");

        // Apply test vectors
       
       for (x = 0; (x <= 7) ; x = x+1 )
       begin
            for (y = 0; (y <= 7) ; y = y+1 )
            begin
                A = x;
                B = y;
                #20;
                $display("A=%0d B=%0d => Sum=%0d Carry=%0d", A, B, sum_rca, cout);
            end
        end

        $display("Test completed");
        $stop;
    end

endmodule