module MIPS_TOP_MODULE (
    input clk, rstn, instr_WE,
    input [31 : 0] instr_WD,
    output [31 : 0] test_value
);
    // Internal Signals
    wire jump, mem_write, reg_write, reg_dest, alu_src, mem_to_reg, PC_src, zero;
    wire [2 : 0] ALU_control;
    wire [31 : 0] instr, mem_data_r, PC, ALU_out, mem_data_w;
    wire [5 : 0] opcode, funct;

    assign opcode = instr[31 : 26];
    assign funct = instr[5 : 0];

    // Data Path
    data_path INTERNAL_DATA_PATH (.clk(clk), .rstn(rstn), .jump(jump), .reg_write(reg_write), .reg_dest(reg_dest), .alu_src(alu_src),
    .mem_to_reg(mem_to_reg), .PC_src(PC_src), .ALU_control(ALU_control), .instr(instr[25 : 0]), .mem_data_r(mem_data_r), 
    .PC(PC), .ALU_out(ALU_out), .mem_data_w(mem_data_w), .zero(zero));

    // Control Unit
    control_unit INTERNAL_CONTROL_UNIT (.zero(zero), .opcode(opcode), .funct(funct), .jump(jump), .reg_write(reg_write),
    .mem_write(mem_write), .reg_dest(reg_dest), .alu_src(alu_src), .mem_to_reg(mem_to_reg), .PC_src(PC_src),
    .ALU_control(ALU_control));

    // Instruction Memory
    instr_mem #(.DATA(32), .ADDR(32), .MEM_DEPTH(256)) INSTRUCTION_MEMORY (.clk(clk), .WE(instr_WE), .WD(instr_WD), .PC(PC), .RD(instr));

    // Data Memory
    data_mem #(.DATA(32), .ADDR(32), .MEM_DEPTH(256)) DATA_MEMORY (.clk(clk), .rstn(rstn), .WE(mem_write), .A(ALU_out), 
    .WD(mem_data_w), .RD(mem_data_r), .test_value(test_value));
endmodule