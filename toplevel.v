`timescale 1ns / 1ps

/**
 * Madhav Datt
 *
 * MIT License
 * Linear Feedback Shift Registers
 */

/**
 * Top Level Module for Linear Feedback Shift Registers
 */
module LFSR (output [3:0] state,
				 input [3:0] seed,
				 input rst, sel, clk
				 );

	wire [3:0] in_w;
	wire [4:0] w;
	wire clock_div;

	// 4-bit state of the 4 DFFs as output
	//assign state[3:0] = {w[1], w[2], w[3], w[4]};
	assign state[3] = w[1];
	assign state[2] = w[2];
	assign state[1] = w[3];
	assign state[0] = w[4];

	// Multiplexers to generate DFF input with seed and w
	// sel is the select value
	MUX m3 (in_w[0], seed[3], w[0], sel),
		 m2 (in_w[1], seed[2], w[1], sel),
		 m1 (in_w[2], seed[1], w[2], sel),
		 m0 (in_w[3], seed[0], w[3], sel);

	// Clock dividor, gives ~4 Hz frequency
	CLKDiv c_div (clock_div, clk, rst);

	// D Flip-Flops to give values to w
	DFF d3 (w[1], in_w[0], clock_div, rst),
		 d2 (w[2], in_w[1], clock_div, rst),
		 d1 (w[3], in_w[2], clock_div, rst),
		 d0 (w[4], in_w[3], clock_div, rst);

	// Feedback to w[0] as w[4] xor w[3]
	assign w[0] = w[4] ^ w[3];

endmodule


/*
 * Top Level Module Augmented for Linear Feedback Shift Registers
 * With 0000 state
 */
module LFSR_Aug (output [3:0] state,
						input [3:0] seed,
						input rst, sel, clk
						);

	wire [3:0] in_w;
	wire [4:0] w;
	wire clock_div;
	wire nor_out;
	wire xor_out;

	// 4-bit state of the 4 DFFs as output
	//assign state[3:0] = {w[1], w[2], w[3], w[4]};
	assign state[3] = w[1];
	assign state[2] = w[2];
	assign state[1] = w[3];
	assign state[0] = w[4];

	// Multiplexers to generate DFF input with seed and w
	// sel is the select value
	MUX m3 (in_w[0], seed[3], w[0], sel),
		 m2 (in_w[1], seed[2], w[1], sel),
		 m1 (in_w[2], seed[1], w[2], sel),
		 m0 (in_w[3], seed[0], w[3], sel);

	// Clock dividor, gives ~4 Hz frequency
	CLKDiv c_div (clock_div, clk, rst);

	// D Flip-Flops to give values to w
	DFF d3 (w[1], in_w[0], clock_div, rst),
		 d2 (w[2], in_w[1], clock_div, rst),
		 d1 (w[3], in_w[2], clock_div, rst),
		 d0 (w[4], in_w[3], clock_div, rst);

	// Feedback to w[0]
	assign nor_out = ~(w[1] | w[2] | w[3]);
	assign xor_out = nor_out^w[4];
	assign w[0] = (xor_out^w[1]);

endmodule
