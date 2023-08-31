module mux_2x1_tb ();
    localparam WIDTH = 4;

    reg sel;
    reg [WIDTH - 1 : 0] in0, in1;
    wire [WIDTH - 1 : 0] out;

    mux_2x1 #(.WIDTH(WIDTH)) uut (.sel(sel), .in0(in0), .in1(in1), .out(out));

    initial begin
        repeat(10) begin
            {sel, in0, in1} = $random;
            #10;
        end
        $stop;
    end
endmodule