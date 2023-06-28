`timescale 1ns / 1ps

module multiplexer_testbench;

	// Inputs
	reg select;
	reg [15:0] input1;
	reg [15:0] input2;

	// Outputs
	wire [15:0] result;

	// Instantiate the Unit Under Test (UUT)
	Multiplexer uut (
		.select(select), 
		.input1(input1), 
		.input2(input2), 
		.result(result)
	);

	initial begin
	
	
		{select, input1, input2} = {1'b0, 16'd1, 16'd2};
		#20 select = 1'b1;

	end
      
endmodule

