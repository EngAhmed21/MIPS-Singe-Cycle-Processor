module MIPS_Program1_tb ();
    reg clk, rstn;
    wire [31 : 0] test_value;

    MIPS_TOP_MODULE uut (.clk(clk), .rstn(rstn), .instr_WE(0), .instr_WD(0), .test_value(test_value));

    localparam CLK_PERIOD = 10;
    always 
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;    rstn = 0;

        $readmemh("Program1_Machine_Code.dat", uut.INSTRUCTION_MEMORY.I_MEM, 0, 255);

        @(negedge clk)  rstn = 1;
        
        repeat (50)  @(negedge clk);
        $stop;
    end
endmodule