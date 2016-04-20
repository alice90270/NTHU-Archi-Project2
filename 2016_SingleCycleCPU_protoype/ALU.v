//Subject:     Architecture project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [4-1:0]   ctrl_i;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
wire             zero_o;

//Parameter

//Main function
always@(*)begin
	case(ctrl_i)
		4'b0000://AND	
			result_o <= src1_i & src2_i;
		4'b0001://OR
			result_o <= src1_i | src2_i;
		4'b0010://ADD
			result_o <= src1_i + src2_i;
		4'b0110://SUB BEQ
			result_o <= src1_i - src2_i;
		4'b0111:begin//SLT
			if(src1_i<src2_i)
				result_o <= 1;
			else
				result_o <= 0;
		end	
		default:
			result_o <= src1_i + src2_i;
	endcase				
end
assign zero_o = (result_o == 32'd0) ? 1 : 0;
endmodule