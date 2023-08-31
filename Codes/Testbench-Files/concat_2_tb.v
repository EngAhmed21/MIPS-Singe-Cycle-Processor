module concat_2_tb ();
    localparam WIDTH_1 = 1;
    localparam WIDTH_2 = 1;

    reg [WIDTH_1 - 1 : 0] in1;
    reg [WIDTH_2 - 1 : 0] in2;
    wire [(WIDTH_1 + WIDTH_2) - 1 : 0] out;

    concat_2 #(.WIDTH_1(WIDTH_1), .WIDTH_2(WIDTH_2)) uut (.in1(in1), .in2(in2), .out(out));

    initial begin
        repeat (10) begin
            {in2, in1} = $random;
            #10;
        end
        $stop;
    end
endmodule