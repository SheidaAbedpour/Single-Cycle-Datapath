`timescale 1ns / 1ps

module ALU(A, B, select, result);

	 input[15:0] A;
	 input[15:0] B;
	 input[2:0] select;
	 
	 output reg[15:0] result;
	 
	 always @(*)
		 begin
			case(select)
				3'b000:
					result = A & B;
				3'b001:
					result = A | B;
				3'b010:
					result = A + B;
				3'b011:
					result = A - B;
				3'b100:
					result = A * B;
				3'b101:
					result = A / B;
				default:
					result = 0;
			endcase
			
		end

endmodule
