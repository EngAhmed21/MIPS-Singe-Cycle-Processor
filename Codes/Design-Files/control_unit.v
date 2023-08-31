module control_unit (
    input zero,
    input [5 : 0] opcode, funct,
    output jump, mem_write, reg_write, reg_dest, alu_src, mem_to_reg, PC_src,
    output [2 : 0] ALU_control
);
    
    wire branch;
    wire [1 : 0] ALU_OP;
    // main_decoder
    main_decoder MAIN_DECOD (.opcode(opcode), .ALU_OP(ALU_OP), .jump(jump), .mem_write(mem_write),
    .reg_write(reg_write), .reg_dest(reg_dest), .alu_src(alu_src), .mem_to_reg(mem_to_reg), 
    .branch(branch));

    // ALU_decoder
    ALU_decoder ALU_DECOD (.ALU_OP(ALU_OP), .funct(funct), .ALU_control(ALU_control));

    // PC_src
    assign PC_src = branch & zero;
endmodule