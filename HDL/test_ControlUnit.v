`timescale 1ns / 1ps

module test_ControlUnit;

	// Inputs
	reg [3:0] opcode;
	reg [3:0] funct;

	// Outputs
	wire regDest;
	wire aluSrc;
	wire memToReg;
	wire regWrite;
	wire memWrite;
	wire branch;
	wire extOp;
	wire [2:0] aluCtr;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.opcode(opcode), 
		.funct(funct), 
		.regDest(regDest), 
		.aluSrc(aluSrc), 
		.memToReg(memToReg), 
		.regWrite(regWrite), 
		.memWrite(memWrite), 
		.branch(branch), 
		.extOp(extOp), 
		.aluCtr(aluCtr)
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		funct = 0;

		// Wait 100 ns for global reset to finish
		#50;
		opcode = 4'b0000;
		funct = 4'b0000;
        
		#50;
		opcode = 4'b0000;
		funct = 4'b0001;
		
		#50;
		opcode = 4'b0000;
		funct = 4'b0010;

		#50;
		opcode = 4'b0000;
		funct = 4'b0011;
		
		#50;
		opcode = 4'b0000;
		funct = 4'b0100;
		
		#50;
		opcode = 4'b0000;
		funct = 4'b0101;
		
		#50;
		opcode = 4'b0001;
		funct = 4'b0000;
		
		#50;
		opcode = 4'b0010;
		funct = 4'b0000;
		
		#50;
		opcode = 4'b0011;
		funct = 4'b1111;
	
		#50;
		opcode = 4'b0100;
		funct = 4'b0000;
		
		#50;
		opcode = 4'b0101;
		funct = 4'b0000;
		// Add stimulus here

	end
      
endmodule

