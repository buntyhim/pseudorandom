`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Author:				Aakash Verma (14CS30001), Madhav Datt (14CS30015) 
// 
// Create Date:    	15:02:41 03/28/2016 
// Design Name: 
// Module Name:    	toplevel 
// Project Name: 		LFSR
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Linear Feedback Shift Registers
//
//////////////////////////////////////////////////////////////////////////////////


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

