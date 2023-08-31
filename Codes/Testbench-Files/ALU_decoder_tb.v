module ALU_decoder_tb ();
    reg [1 : 0] ALU_OP;
    reg [5 : 0] funct;
    wire [2 : 0] ALU_control;

    ALU_decoder uut (.ALU_OP(ALU_OP), .funct(funct), .ALU_control(ALU_control));

    initial begin
        repeat (30) begin
            {ALU_OP, funct} = $random;
            #10;
        end
        $stop;
    end
endmodule