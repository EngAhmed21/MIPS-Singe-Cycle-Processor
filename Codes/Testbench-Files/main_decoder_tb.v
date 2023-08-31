module main_decoder_tb ();
    reg [5 : 0] opcode;
    wire [1 : 0] ALU_OP;
    wire jump, mem_write, reg_write, reg_dest, alu_src, mem_to_reg, branch;

    main_decoder uut (.opcode(opcode), .ALU_OP(ALU_OP), .jump(jump), .mem_write(mem_write),
    .reg_write(reg_write), .reg_dest(reg_dest), .alu_src(alu_src), .mem_to_reg(mem_to_reg), 
    .branch(branch));

    initial begin
        repeat (30) begin
            opcode = $random;
            #10;
        end
        $stop;
    end
endmodule