module ALU #(parameter WIDTH = 8) (
    input [WIDTH - 1 : 0] A, B,
    input [2 : 0] opcode,
    output reg [WIDTH - 1 : 0] ALU_out,
    output zero_flag
);

    // ALU operations
    always @(*) begin
        case(opcode)
            3'b000:    ALU_out = A & B;
            3'b001:    ALU_out = A | B;
            3'b010:    ALU_out = A + B;
            3'b100:    ALU_out = A - B;
            3'b101:    ALU_out = A * B;
            3'b110:    ALU_out = (A < B);    
            default:   ALU_out = 32'b0;
        endcase
    end

    // Flags
    assign zero_flag = ~|(ALU_out);
endmodule