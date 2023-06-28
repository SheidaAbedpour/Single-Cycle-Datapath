`timescale 1ns / 1ps

module CPU(clk, data_rs, data_rt, data_rd, ALUsrc_result, instruction, ALU_result, pc, ALUctr);

	input clk;
	
	output reg [15:0] pc;
	wire [15:0] next_pc;
	
	wire inst_memo_read;
	output wire [19:0] instruction;
	
	wire regDst, aluSrc, memotoReg, regWrite, memoWite, branch, ExtOp;
	output wire[2:0] ALUctr;
	
	wire [15:0] regDst_mux_result;
	output wire [15:0] data_rs, data_rt, data_rd;
	
	wire [15:0] imm_extended;
	
	output wire [15:0] ALUsrc_result;
	reg zero;
	output wire [15:0] ALU_result;
	
	wire momo_read;
	wire [15:0] memo_read_data;
	
	wire [15:0] pc_branch, pc_plus_1;
	wire [15:0] pc_mux;
	wire next_pc_mux_select;
	
	initial pc <= 16'd0;
	
	always@ (posedge clk) pc <= next_pc;
	
	assign pc_plus_1 = pc + 1;
	assign pc_branch = (pc + 1) + (imm_extended << 2);
	
	assign inst_memo_read = 1'b1;
	assign memo_read = 1'b1;
	
	assign next_pc_mux_result = ~zero & branch;
	always@(*) begin
			if(ALU_result == 0) begin
					zero <= 1;
				end
			else begin
					zero <= 0;
				end
		end
			
		
	
	InstructionMemory instruction_memo(.address(pc), .memo_read(inst_memo_read), .instruction(instruction));
	
	DataMemory data_memory(.clk(clk), .address(ALU_result), .data_write(data_rt), .memo_read(memo_read),
              	           .memo_write(memoWrite), .data_read(memo_read_data));
	
	ControlUnit control_unit(.opcode(instruction[19:16]), .funct(instruction[3:0]),
                          	 .regDest(regDst), .aluSrc(aluSrc), .memToReg(memotoReg), .regWrite(regWrite), 
									 .memWrite(memoWrite), .branch(branch), .extOp(ExtOp), .aluCtr(ALUctr));
									 
	RegisterFile register_file(.clk(clk), .rs(instruction[15:12]), .rt(instruction[11:8]), .rd(instruction[7:4]),
	                          .data_write(data_rd), .reg_write(regWrite),
									  .data_read_1(data_rs), .data_read_2(data_rt));
									  
									  
	ALU alu(.A(data_rs), .B(ALUsrc_result), .select(ALUctr), .result(ALU_result));
	
	Extend extend(.imm(instruction[7:0]), .exOp(ExtOp), .result(imm_extended));
	
	Multiplexer mux_regDst(.select(regDst), .input1(data_rd), .input2(data_rt), .result(regDst_mux_result));
	
	Multiplexer mux_aluSrc(.select(aluSrc), .input1(data_rt), .input2(imm_extended), .result(ALUsrc_result));  
	
	Multiplexer mux_memotoReg(.select(memotoReg), .input1(ALU_result), .input2(memo_read_data), .result(data_rd));
	
	Multiplexer mux_nextPC(.select(next_pc_mux_result), .input1(pc_plus_1), .input2(pc_branch), .result(next_pc));
	

endmodule
