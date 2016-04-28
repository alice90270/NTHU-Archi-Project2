//Subject:     Architecture project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	MemWrite_o,
	MemRead_o,
	MemtoReg_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;//(R|lw|addi|stli)=1
output [8-1:0] ALU_op_o; 
output         ALUSrc_o; //(lw|sw|addi|stli)=1
output         RegDst_o; //(R)=1
output         Branch_o; //(beq)=1
output			MemWrite_o;
output			MemRead_o;
output			MemtoReg_o; 

//Internal Signals
reg    [8-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg			MemWrite_o;
reg			MemRead_o;
reg			MemtoReg_o; 
//Parameter


//Main function
always@(*)begin
	case(instr_op_i[0:5])
		6'h00: begin
			ALU_op_o <= 8'h00; //R
			Branch_o<=0;
			ALUSrc_o <= 0;
			RegWrite_o<=1;
			RegDst_o<=1;
			MemWrite_o<=0;
			MemRead_o<=0;
			MemtoReg_o<=0;
		end
		6'h08: begin
			ALU_op_o <= 8'h08; //ADDI
			Branch_o<=0;
			ALUSrc_o <= 1;
			RegWrite_o<=1;
			RegDst_o<=0;
			MemWrite_o<=0;
			MemRead_o<=0;
			MemtoReg_o<=0;
		end
		6'h23: begin
			ALU_op_o <= 8'h23; //LW
			Branch_o<=0;
			ALUSrc_o <= 1;
			RegWrite_o<=1;
			RegDst_o<=0;
			MemWrite_o<=0;
			MemRead_o<=0;
			MemtoReg_o<=0;
		end
		6'h2B: begin
			ALU_op_o <= 8'h2B; //SW
			Branch_o<=0;
			ALUSrc_o <= 1;
			RegWrite_o<=0;
			RegDst_o<=0;
			MemWrite_o<=1;
			MemRead_o<=0;
			MemtoReg_o<=0;
		end
		6'h0A: begin
			ALU_op_o <= 8'h0A; //SLTI
			Branch_o<=0;
			ALUSrc_o <= 1;
			RegWrite_o<=1;
			RegDst_o<=0;
			MemWrite_o<=0;
			MemRead_o<=0;
			MemtoReg_o<=0;
		end
		6'h04: begin
			ALU_op_o <= 8'h04; //BEQ
			Branch_o<=1;
			ALUSrc_o <= 0;
			RegWrite_o<=0;
			RegDst_o<=0;
			MemWrite_o<=0;
			MemRead_o<=0;
			MemtoReg_o<=0;
			
		end	
	endcase
end

endmodule