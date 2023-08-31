module register_file_tb ();
    localparam DATA = 32;
    localparam ADDR = 5;

    reg clk, rstn, WE;
    reg [ADDR - 1 : 0] RA1, RA2, WA;
    reg [DATA - 1 : 0] WD;
    wire [DATA - 1 : 0] RD1, RD2;
    
    register_file #(.DATA(DATA), .ADDR(ADDR)) uut (.clk(clk), .rstn(rstn), .WE(WE),
    .WA(WA), .RA1(RA1), .RA2(RA2), .WD(WD), .RD1(RD1), .RD2(RD2));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;    rstn = 0;
        WE = 0;     
        {RA1, RA2} = $random;
        WA = $random;
        WD = $urandom_range(0, 100);

        @(negedge clk)  rstn = 1;

        @(negedge clk)  WE = 1;

        repeat(10) begin
            @(negedge clk);  
            WA = $random;
            WD = $urandom_range(0, 100);
        end

        repeat(10)
            @(negedge clk)  {RA1, RA2} = $random;

        $stop;
    end

endmodule