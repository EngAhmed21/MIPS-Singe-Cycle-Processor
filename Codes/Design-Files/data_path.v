module data_path (
    input clk, rstn,
    input reg_write, reg_dest, alu_src, mem_to_reg, PC_src, jump,
    input [2 : 0] ALU_control,
    input [25 : 0] instr,
    input [31 : 0] mem_data_r,
    output [31 : 0] PC, ALU_out, mem_data_w,
    output zero
);

    // Internal Signals
    wire zero_flag;
    wire [4 : 0] reg_RA1, reg_RA2, reg_WA;
    wire [31 : 0] reg_WD, reg_RD1, reg_RD2, src_B, sign_imm, ALU_result;
    wire [31 : 0] PC_reg, PC_next, PC_plus4, PC_branch, sign_imm_sh, PC_jump, PC_src_out;
    wire [27 : 0] instr_sh;

    assign reg_RA1 = instr[25 : 21];
    assign reg_RA2 = instr[20 : 16];

    // Register File
    mux_2x1 #(.WIDTH(5)) W_REG_ADDR (.sel(reg_dest), .in0(instr[20 : 16]), .in1(instr[15 : 11]), .out(reg_WA));
    mux_2x1 #(.WIDTH(32)) W_REG_DATA (.sel(mem_to_reg), .in0(ALU_result), .in1(mem_data_r), .out(reg_WD));
    register_file #(.DATA(32), .ADDR(5)) REG_File (.clk(clk), .rstn(rstn), .WE(reg_write), .WA(reg_WA),
    .RA1(reg_RA1), .RA2(reg_RA2), .WD(reg_WD), .RD1(reg_RD1), .RD2(reg_RD2));
    
    // Sign Extend
    sign_extend #(.INPU_WIDTH(16), .OUTPUT_WIDTH(32)) SIGN_IMM_EXTEND (.in(instr[15 : 0]), .out(sign_imm));

    // ALU
    mux_2x1 #(.WIDTH(32)) ALU_src_B (.sel(alu_src), .in0(reg_RD2), .in1(sign_imm), .out(src_B));
    ALU #(.WIDTH(32)) MIPS_ALU (.A(reg_RD1), .B(src_B), .opcode(ALU_control), .ALU_out(ALU_result), .zero_flag(zero_flag));

    // PC
    Adder #(.WIDTH(32)) PC_PLUS4_ADD (.in0(PC_reg), .in1(32'd4), .out(PC_plus4));
    shift_2_right #(.WIDTH(32)) SIGN_IMM_SHIFT (.in(sign_imm), .out(sign_imm_sh));
    Adder #(.WIDTH(32)) PC_BRANCH_ADD (.in0(sign_imm_sh), .in1(PC_plus4), .out(PC_branch));
    shift_2_right #(.WIDTH(28)) INSTR_SHIFT (.in({2'b00, instr[25 : 0]}), .out(instr_sh));
    concat_2 #(.WIDTH_1(28), .WIDTH_2(4)) PC_CONCAT (.in1(instr_sh), .in2(PC_plus4[31 : 28]), .out(PC_jump));
    mux_2x1 #(.WIDTH(32)) PC_SOURCE (.sel(PC_src), .in0(PC_plus4), .in1(PC_branch), .out(PC_src_out));
    mux_2x1 #(.WIDTH(32)) PC_JUMP (.sel(jump), .in0(PC_src_out), .in1(PC_jump), .out(PC_next));
    D_FF #(.WIDTH(32)) PC_FF (.clk(clk), .rstn(rstn), .D(PC_next), .Q(PC_reg));

    // OUTPUT
    assign PC = PC_reg;
    assign ALU_out = ALU_result;
    assign mem_data_w = reg_RD2;
    assign zero = zero_flag;
endmodule