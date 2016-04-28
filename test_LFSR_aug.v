`timescale 1ns / 1ps

/**
 * Madhav Datt
 *
 * MIT License
 * Augmented Linear Feedback Shift Registers Test Modules
 */

module test_aug;

	// Inputs
	reg [3:0] seed;
	reg rst;
	reg sel;
	reg clk;

	// Outputs
	wire [3:0] state;

	// Instantiate the Unit Under Test (UUT)
	LFSR_Aug uut (
		.state(state),
		.seed(seed),
		.rst(rst),
		.sel(sel),
		.clk(clk)
	);

	initial begin
		clk = 1'b0;
		forever
			#20 clk = ~clk;
	end

	initial begin
		seed = 4'b0000;
		rst = 1'b1;
		sel = 1'b0;

		#80;
		rst = 1'b0;
		sel = 1'b0;

		#80;
		rst = 1'b0;
		sel = 1'b1;
	end

endmodule
