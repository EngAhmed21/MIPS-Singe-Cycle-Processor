module Adder #(parameter WIDTH = 4)(
    input [WIDTH - 1 : 0] in0, in1,
    output [WIDTH - 1 : 0] out
);

    assign out = in0 + in1;
endmodule