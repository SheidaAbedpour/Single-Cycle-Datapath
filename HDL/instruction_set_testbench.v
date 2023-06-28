`timescale 1ns / 1ps

module instruction_set_testbench;

	// Inputs
	reg [15:0] address;
	reg memo_read;

	// Outputs
	wire [19:0] instruction;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.address(address), 
		.memo_read(memo_read), 
		.instruction(instruction)
	);

	initial begin

		address = 0;
		memo_read = 0;

		$monitor("%b", instruction);
		
		memo_read = 1'b0;
		address = 16'd0;

		#5
		memo_read = 1'b1;
		address = 16'd0;
		
	end

	initial repeat(127)#4 address = address + 1;
      
endmodule

