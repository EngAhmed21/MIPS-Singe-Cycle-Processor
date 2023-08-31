module shift_2_right #(parameter WIDTH = 8)(
    input [WIDTH - 1 : 0] in,
    output [WIDTH - 1 : 0] out
);

    assign out = (in << 2);
endmodule