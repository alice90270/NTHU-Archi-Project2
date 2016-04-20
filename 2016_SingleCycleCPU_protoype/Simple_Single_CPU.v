`timescale 1ns / 1ps
//Subject:     Architecture project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: Structure for R-type
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
    clk_i,
	rst_i
);
		
//I/O port
input         clk_i;
input         rst_i;

//Internal Signals
wire [32-1:0] mux_dataMem_result_w;
wire ctrl_register_write_w;

//Create components
ProgramCounter PC(
        .clk_i(),      
	    .rst_i (),     
	    .pc_in_i() ,   
	    .pc_out_o() 
	    );
	
Adder Adder1(
        .src1_i(),     
	    .src2_i(),     
	    .sum_o()    
	    );
	
Instr_Memory IM(
        .pc_addr_i(),  
	    .instr_o()    
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	

//DO NOT MODIFY	.RDdata_i && .RegWrite_i
Reg_File RF(
        .clk_i(),
		.rst_i(),
		.RSaddr_i() ,
		.RTaddr_i() ,
		.RDaddr_i() ,
		.RDdata_i(mux_dataMem_result_w[31:0]),
		.RegWrite_i(ctrl_register_write_w),
		.RSdata_o() ,
		.RTdata_o()
        );
	
//DO NOT MODIFY	.RegWrite_o
Decoder Decoder(
        .instr_op_i(), 
	    .RegWrite_o(ctrl_register_write_w), 
	    .ALU_op_o(),   
	    .ALUSrc_o(),   
	    .RegDst_o(),   
		.Branch_o(), 
		.MemWrite_o(),
		.MemRead_o(),
		.MemtoReg_o()
	    );

ALU_Ctrl AC(
        .funct_i(),   
        .ALUOp_i(),   
        .ALUCtrl_o() 
        );
	
Sign_Extend SE(
        .data_i(),
        .data_o()
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	
		
ALU ALU(
        .src1_i(),
	    .src2_i(),
	    .ctrl_i(),
	    .result_o(),
		.zero_o()
	    );
		
Adder Adder2(
        .src1_i(),     
	    .src2_i(),     
	    .sum_o()      
	    );
		
Shift_Left_Two_32 Shifter(
        .data_i(),
        .data_o()
        ); 		
		
MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o()
        );	
		
Data_Memory DataMemory(
		.clk_i(),
		.rst_i(),
		.addr_i(),
		.data_i(),
		.MemRead_i(),
		.MemWrite_i(),
		.data_o()
		);

//DO NOT MODIFY	.data_o
 MUX_2to1 #(.size(32)) Mux_DataMem_Read(
        .data0_i(),
        .data1_i(),
        .select_i(),
        .data_o(mux_dataMem_result_w)
		);

endmodule