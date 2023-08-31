module ALU_tb ();
    localparam WIDTH = 4;

    reg [WIDTH - 1 : 0] A, B;
    reg [2 : 0] opcode;
    wire [WIDTH - 1 : 0] ALU_out;
    wire zero_flag;
    
    ALU #(.WIDTH(WIDTH)) uut (.A(A), .B(B), .opcode(opcode), .ALU_out(ALU_out), .zero_flag(zero_flag));

    initial begin
      repeat(20) begin
        {A, B, opcode} = $random;
        #10; 
      end
      $stop;
    end
endmodule