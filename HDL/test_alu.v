`timescale 1ns / 1ps

module test_alu;

	// Inputs
	reg [15:0] A;
	reg [15:0] B;
	reg [2:0] select;

	// Outputs
	wire [15:0] result;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.A(A), 
		.B(B), 
		.select(select), 
		.result(result)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		select = 0;

		// Wait 100 ns for global reset to finish
		#100;
      A = 9;
		B = 23;
		select = 3'b000;
		
		#100;
      A = 20;
		B = 10;
		select = 3'b001;
		
		#100;
      A = 16;
		B = 16;
		select = 3'b010;
		
		#100;
      A = 32;
		B = 14;
		select = 3'b011;
		
		#100;
      A = 8;
		B = 7;
		select = 3'b100;
		
		#100;
      A = 20;
		B = 3;
		select = 3'b101;
		// Add stimulus here

	end
endmodule

