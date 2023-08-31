module instr_mem_tb ();
    localparam DATA = 32;
    localparam ADDR = 32;
    localparam MEM_DEPTH = 256;

    reg [ADDR - 1 : 0] PC;
    wire [DATA - 1 : 0] RD;

    instr_mem #(.DATA(DATA), .ADDR(ADDR), .MEM_DEPTH(MEM_DEPTH)) uut (.clk(0), .WE(0), .WD(0), .PC(PC), .RD(RD));

    initial begin
        $readmemh("Program1_Machine_Code.dat", uut.I_MEM, 0, 255);
        
        repeat(10) begin
            PC = $urandom_range(0, 13);
            #10;
        end
        $stop;
    end
endmodule