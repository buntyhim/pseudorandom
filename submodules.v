`timescale 1ns / 1ps

/**
 * Madhav Datt
 *
 * MIT License
 * Submodules D Flip-Flop, Multiplexer, Clock Dividor
 */

/**
 * D Fli-Flop Module
 */
module DFF (output reg out,
			input in, clk, rst
			);

	always @ (posedge clk or posedge rst)
	begin
		if (rst == 1'b1)
			out <= 1'b0;
		else
			out <= in;
	end

endmodule

/**
 * Multiplexer Module
 * out = a * ~sel + b * sel
 */
module MUX (output reg out,
			input a,b,sel
		    );

	always @ (sel or a or b)
	begin
		if (sel == 1'b1)
			out = b;
		else
			out = a;
	end

endmodule

/**
 * Clock Dividor
 * Slows clock speed by a factor of 2^20 (~10^6)
 * For 4 MHz clock of FPGA, output will be ~4 Hz
 */
module CLKDiv (output clk_div,
			   input clk, rst
			   );

	reg [19:0] outclk;

	always @ (posedge clk or posedge rst)
	begin
		 if (rst == 1'b1)
			   outclk <= 20'b0;
		 else
			  outclk <= outclk + 1'b1;
	end

    // Give MSB of 20-bit counter
	assign clk_div = outclk[19];
endmodule
