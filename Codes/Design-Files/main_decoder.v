module main_decoder (
    input [5 : 0] opcode,
    output reg [1 : 0] ALU_OP,
    output reg jump, mem_write, reg_write, reg_dest, alu_src, mem_to_reg, branch
);

    always @(*) begin
        case (opcode)
            6'b00_0000:     begin   // R-Type
                jump = 1'b0;           mem_write = 1'b0;
                reg_write = 1'b1;      reg_dest = 1'b1;
                alu_src = 1'b0;        mem_to_reg = 1'b0;
                branch = 1'b0;         ALU_OP = 2'b10;
            end
            6'b00_0010:     begin   // jump_inst 
                jump = 1'b1;           mem_write = 1'b0;
                reg_write = 1'b0;      reg_dest = 1'b0;
                alu_src = 1'b0;        mem_to_reg = 1'b0;
                branch = 1'b0;         ALU_OP = 2'b00;
            end
            6'b00_0100:     begin   // branchIfEqual 
                jump = 1'b0;           mem_write = 1'b0;
                reg_write = 1'b0;      reg_dest = 1'b0;
                alu_src = 1'b0;        mem_to_reg = 1'b0;
                branch = 1'b1;         ALU_OP = 2'b01;
            end
            6'b00_1000:     begin   // addImmediate
                jump = 1'b0;           mem_write = 1'b0;
                reg_write = 1'b1;      reg_dest = 1'b0;
                alu_src = 1'b1;        mem_to_reg = 1'b0;
                branch = 1'b0;         ALU_OP = 2'b00;
            end
            6'b10_0011:     begin   // loadWord
                jump = 1'b0;           mem_write = 1'b0;
                reg_write = 1'b1;      reg_dest = 1'b0;
                alu_src = 1'b1;        mem_to_reg = 1'b1;
                branch = 1'b0;         ALU_OP = 2'b00; 
            end
            6'b10_1011:     begin   // storeWord 
                jump = 1'b0;           mem_write = 1'b1;
                reg_write = 1'b0;      reg_dest = 1'b0;
                alu_src = 1'b1;        mem_to_reg = 1'b1;
                branch = 1'b0;         ALU_OP = 2'b00; 
            end
            default:        begin
                jump = 1'b0;           mem_write = 1'b0;
                reg_write = 1'b0;      reg_dest = 1'b0;
                alu_src = 1'b0;        mem_to_reg = 1'b0;
                branch = 1'b0;         ALU_OP = 2'b00;
            end 
        endcase
    end
endmodule