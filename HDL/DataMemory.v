`timescale 1ns / 1ps

module DataMemory
	
	#(parameter memo_array_size = 65536)

   (input clk,
	 input [15:0] address,
	 input [15:0] data_write,
	 input memo_read,
	 input memo_write,
	 output [15:0] data_read 
    );
	 
	 
	 reg [15:0] memo_array [memo_array_size - 1: 0];
	 integer i;
	 
	// initial begin
		//		for(i = 0; i < memo_array_size; i = i + 1) begin
			//			memo_array[i] <= 16'd0;
				//	end
			//	end
				
				
		always@(posedge clk) begin
				if (memo_write) begin
						memo_array[address[15:0]] = data_write[15:0];
					end
				end
				
				
		assign data_read = (memo_read) ? memo_array[address[15:0]] : 16'd0;
		
		
endmodule
