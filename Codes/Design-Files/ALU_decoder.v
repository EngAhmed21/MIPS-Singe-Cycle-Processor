module ALU_decoder (
    input [1 : 0] ALU_OP,
    input [5 : 0] funct,
    output reg [2 : 0] ALU_control
);
    
    always @(*) begin
        case (ALU_OP)
            2'b01:      ALU_control = 3'b100;
            2'b10:      
                if (funct == 6'b10_0000)        // ADD
                    ALU_control = 3'b010;
                else if (funct == 6'b10_0010)   // SUB
                    ALU_control = 3'b100;
                else if (funct == 6'b10_1010)   // SLT
                    ALU_control = 3'b110;
                else if (funct == 6'b01_1100)   // MUL
                    ALU_control = 3'b101;
                else
                    ALU_control = 3'b010;
            default:    ALU_control = 3'b010;
        endcase
    end
endmodule