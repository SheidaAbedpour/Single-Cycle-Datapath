`timescale 1ns / 1ps

module Multiplexer

	#(parameter data_bits = 16)

	(input select,
	 input [data_bits - 1:0] input1,
	 input [data_bits - 1:0] input2,
	 output [data_bits - 1:0] result
    );
	 
	assign result = (select) ? input2 : input1;

endmodule
