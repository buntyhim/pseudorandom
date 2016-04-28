`timescale 1ns / 1ps

/**
 * Madhav Datt
 *
 * MIT License
 * Basic Linear Feedback Shift Registers Test Modules
 */

module test;

	// Inputs
	reg [3:0] seed;
	reg rst;
	reg sel;
	reg clk;

	// Outputs
	wire [3:0] state;

	// Instantiate the Unit Under Test (UUT)
	LFSR uut (
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
		seed = 4'b1111;
		rst = 1'b1;
		sel = 1'b0;

		#100;
		rst = 1'b0;
		sel = 1'b0;

		#100;
		rst = 1'b0;
		sel = 1'b1;
	end

endmodule
