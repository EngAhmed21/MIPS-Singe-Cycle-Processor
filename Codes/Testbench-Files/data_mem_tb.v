module data_mem_tb ();
    localparam DATA = 32;
    localparam ADDR = 32;
    localparam MEM_DEPTH = 256;

    reg clk, rstn, WE;
    reg [ADDR - 1 : 0] A;
    reg [DATA - 1 : 0] WD;
    wire [DATA - 1 : 0] RD, test_value;
    
    data_mem #(.DATA(DATA), .ADDR(ADDR), .MEM_DEPTH(MEM_DEPTH)) uut (.clk(clk), .rstn(rstn),
    .WE(WE), .A(A), .WD(WD), .RD(RD), .test_value(test_value));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;    rstn = 0;
        WE = 0;     A = 0;
        WD = 0;

        @(negedge clk)  rstn = 1;

        @(negedge clk);
        WE = 1;
        WD = 15;

        repeat (20) begin
            #(CLK_PERIOD);
            A = $urandom_range(0, 255);
            WD = $urandom_range(0, 100);
        end
        @(negedge clk)  $stop;
    end
endmodule