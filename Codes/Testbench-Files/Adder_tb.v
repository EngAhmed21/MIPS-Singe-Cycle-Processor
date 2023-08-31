module Adder_tb ();
    localparam WIDTH = 4;

    reg [WIDTH - 1 : 0] in0, in1;
    wire [WIDTH - 1 : 0] out;

    Adder #(.WIDTH(WIDTH)) uut (.in0(in0), .in1(in1), .out(out));

    initial begin
        repeat(10) begin
            {in0, in1} = $random;
            #10;
        end
        $stop;
    end
endmodule