`timescale 1ns / 1ps

module Extend

	(input [7:0] imm,
	 input exOp,
	 output [15:0] result
    );

	assign result = (exOp) ? {{8{imm[7]}}, imm[7:0]} : {{8{1'b0}}, imm[7:0]};

endmodule
