module shift_2_right_tb ();
    localparam WIDTH = 8;

    reg [WIDTH - 1 : 0] in;
    wire [WIDTH - 1 : 0] out;

    shift_2_left #(.WIDTH(WIDTH)) uut (.in(in), .out(out));

    initial begin
        repeat(10) begin
            in = $random;
            #10;
        end
        $stop;
    end
endmodule