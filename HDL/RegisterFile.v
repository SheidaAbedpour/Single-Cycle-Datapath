`timescale 1ns / 1ps

module RegisterFile

	(input clk,
	 input [3:0] rs,
	 input [3:0] rt,
	 input [3:0] rd,
	 input [15:0] data_write,
	 input reg_write,
	 output [15:0] data_read_1,
	 output [15:0] data_read_2
    );
	 
	 reg [15:0] registerfile [15:0]; 
	 
	 integer i;
	 
	initial begin
		for(i = 0; i < 16; i = i + 1) begin
				registerfile[i] = 16'd0;
			end
		end
	 
	always@ (posedge clk) begin 
			if(reg_write) begin 
				registerfile[rd] = data_write;
			end
		end
		
	assign data_read_1 = registerfile[rs];
	assign data_read_2 = registerfile[rt];

endmodule
