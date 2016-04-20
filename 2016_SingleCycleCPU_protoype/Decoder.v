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
	Branch_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;//(R|lw|addi|stli)=1
output [3-1:0] ALU_op_o; 
output         ALUSrc_o; //(lw|sw|addi|stli)=1
output         RegDst_o; //(R)=1
output         Branch_o; //(beq)=1
 
//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;

//Parameter


//Main function
always@(*)begin
	case(instr_op_i[0:5])
		6'h00: begin
			ALU_op_o <= 3'h00; //R
			Branch_o<=0;
			ALUSrc_o <= 0;
			RegWrite_o<=1;
			RegDst_o<=1;
		end
		6'h08: begin
			ALU_op_o <= 3'h08; //ADDI
			Branch_o<=0;
			ALUSrc_o <= 1;
			RegWrite_o<=1;
			RegDst_o<=0;
		end
		6'h23: begin
			ALU_op_o <= 3'h23; //LW
			Branch_o<=0;
			ALUSrc_o <= 1;
			RegWrite_o<=1;
			RegDst_o<=0;
		end
		6'h2B: begin
			ALU_op_o <= 3'h2B; //SW
			Branch_o<=0;
			ALUSrc_o <= 1;
			RegWrite_o<=0;
			RegDst_o<=0;
		end
		6'h0A: begin
			ALU_op_o <= 3'h0A; //SLTI
			Branch_o<=0;
			ALUSrc_o <= 1;
			RegWrite_o<=1;
			RegDst_o<=0;
		end
		6'h04: begin
			ALU_op_o <= 3'h04; //BEQ
			Branch_o<=1;
			ALUSrc_o <= 0;
			RegWrite_o<=0;
			RegDst_o<=0;
		end	
	endcase
end

endmodule