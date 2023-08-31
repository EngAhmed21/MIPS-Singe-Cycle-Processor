module sign_extend_tb ();
    localparam INPU_WIDTH = 4;
    localparam OUTPUT_WIDTH = 8;

    reg [INPU_WIDTH - 1 : 0] in;
    wire [OUTPUT_WIDTH - 1 : 0] out;

    sign_extend #(.INPU_WIDTH(INPU_WIDTH), .OUTPUT_WIDTH(OUTPUT_WIDTH)) uut (.in(in), .out(out));

    initial begin
        repeat(10) begin
            in = $random;
            #10;
        end
        $stop;
    end
endmodule
