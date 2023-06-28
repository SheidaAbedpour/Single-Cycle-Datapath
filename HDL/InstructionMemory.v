`timescale 1ns / 1ps

module InstructionMemory

	(input [15:0] address,
	 input memo_read,
	 output reg [19:0] instruction
    );
	 
	 reg [19:0] memo_array [255:0];
	 
	 initial begin 
			$readmemb("instruction.mem", memo_array);
		end
	 
	 always@(*) begin 
				if(memo_read) begin 	
					instruction[19:0] = memo_array[address[15:0]];
				end
			end


endmodule
