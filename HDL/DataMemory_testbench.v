`timescale 1ns / 1ps

module DataMemory_testbench;

	// Inputs
	reg clk;
	reg [15:0] address;
	reg [15:0] data_write;
	reg memo_read;
	reg memo_write;

	// Outputs
	wire [15:0] data_read;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.clk(clk), 
		.address(address), 
		.data_write(data_write), 
		.memo_read(memo_read), 
		.memo_write(memo_write), 
		.data_read(data_read)
	);

	initial begin
		
		clk = 1'b0;
		#20 {clk, address, data_write, memo_read, memo_write} = {1'b1, 16'd0, 16'b1, 1'b0, 1'b1};		
		#20 clk = 1'b0;
		
		#20 {memo_read, address, clk} = {1'b1, 16'd0, 1'b1};
		#20 clk = 1'b0;
	
	end
      
endmodule

