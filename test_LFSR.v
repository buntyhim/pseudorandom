`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:49:01 03/28/2016
// Design Name:   LFSR
// Module Name:   C:/Users/student/Desktop/LFSR/test2.v
// Project Name:  LFSR
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: LFSR
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test2;

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

