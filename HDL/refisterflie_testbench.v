`timescale 1ns / 1ps

module refisterflie_testbench;

	// Inputs
	reg clk;
	reg [3:0] rs;
	reg [3:0] rt;
	reg [3:0] rd;
	reg [15:0] data_write;
	reg reg_write;

	// Outputs
	wire [15:0] data_read_1;
	wire [15:0] data_read_2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.clk(clk), 
		.rs(rs), 
		.rt(rt), 
		.rd(rd), 
		.data_write(data_write), 
		.reg_write(reg_write), 
		.data_read_1(data_read_1), 
		.data_read_2(data_read_2)
	);

	initial begin
	
		clk = 0;
		
		#20 {clk, rs, rt, rd, data_write, reg_write} = {1'b1, 4'd1, 4'd2, 4'd3, 16'd12, 1'b0};
		#20 clk = 0;
		
		#20 {clk, reg_write, rs} = {1'b1, 1'b1, 4'd3};
		#20 clk = 0;

	end
      
endmodule

