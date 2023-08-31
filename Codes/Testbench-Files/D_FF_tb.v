module D_FF_tb ();
    localparam WIDTH = 1;

    reg clk, rstn;
    reg [WIDTH - 1 : 0] D;
    wire [WIDTH - 1 : 0] Q;

    D_FF #(.WIDTH(WIDTH)) uut (.clk(clk), .rstn(rstn), .D(D), .Q(Q));

    localparam CLK_PERIOD = 10;
    always
        #(CLK_PERIOD / 2)  clk = ~clk;

    initial begin
        clk = 1;    rstn = 0;
        D = 0;

        @(negedge clk)  rstn = 1;

        repeat(10)  @(negedge clk)  D = $random;

        @(negedge clk)  $stop;
    end
endmodule