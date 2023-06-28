`timescale 1ns / 1ps

module datapath_testbench;

	// Inputs
	reg clk;
	
	// Outputs
	wire [15:0] data_rs;
	wire [15:0] data_rt;
	wire [15:0] data_rd;
	wire [15:0] ALUsrc_result;
	wire [19:0] instruction;
	wire [15:0] ALU_result;
	wire [15:0] pc;
	wire [2:0] ALUctr;

	// Instantiate the Unit Under Test (UUT)
	CPU uut (
		.clk(clk),
		.data_rs(data_rs), 
		.data_rt(data_rt), 
		.data_rd(data_rd), 
		.ALUsrc_result(ALUsrc_result),
		.instruction(instruction),
		.ALU_result(ALU_result),
		.pc(pc),
		.ALUctr(ALUctr)
		);

	initial begin
		
		clk = 0;		
		repeat (30) 
			#20 clk = ~clk;

	end
      
endmodule

