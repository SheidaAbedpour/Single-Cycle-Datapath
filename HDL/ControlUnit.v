`timescale 1ns / 1ps

module ControlUnit(opcode, funct, regDest, aluSrc, memToReg, regWrite, memWrite, branch, extOp, aluCtr);

	 input[3:0] opcode;
	 input[3:0] funct;
	 output reg regDest, aluSrc, memToReg, regWrite, memWrite, branch, extOp;
	 output reg[2:0] aluCtr;
	 
	 reg op0, op1, op2, op3;
	 reg rType, andI, orI, bnq, lw, sw;
	 reg[2:0] aluOp;
	 
	 always @(*)
		begin
		 {op3, op2, op1, op0} = opcode;
		 
		 rType = ~op0 & ~op1 & ~op2 & ~op3;
		 andI = op0 & ~op1 & ~op2 & ~op3;
		 orI = ~op0 & op1 & ~op2 & ~op3;
		 bnq = op0 & op1 & ~op2 & ~op3;
		 lw = ~op0 & ~op1 & op2 & ~op3;
		 sw = op0 & ~op1 & op2 & ~op3;
		 
		 regDest = rType;
		 aluSrc = andI | orI | lw | sw;
		 memToReg = lw;
		 regWrite = andI | orI | lw | rType;
		 memWrite = sw;
		 branch = bnq;
		 extOp = bnq | lw | sw | andI;
		 
		 aluOp[2] = rType;
		 aluOp[1] = rType | bnq | lw | sw;
		 aluOp[0] = bnq | orI;
		 
		 if(rType == 1)
			aluCtr[2:0] = funct[2:0];
		 else
			aluCtr = aluOp;
			
		 end


endmodule
