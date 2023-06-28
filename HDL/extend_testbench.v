`timescale 1ns / 1ps

module extend_testbench;

	// Inputs
	reg [7:0] imm;
	reg exOp;

	// Outputs
	wire [15:0] result;

	// Instantiate the Unit Under Test (UUT)
	Extend uut (
		.imm(imm), 
		.exOp(exOp), 
		.result(result)
	);

	initial begin
		
		{imm, exOp} = {8'b11000001, 1'b0};
		#20 exOp = 1;

	end
      
endmodule

