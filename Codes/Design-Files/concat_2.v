module concat_2 #(parameter WIDTH_1 = 1, WIDTH_2 = 1) (
    input [WIDTH_1 - 1 : 0] in1,
    input [WIDTH_2 - 1 : 0] in2,
    output [(WIDTH_1 + WIDTH_2) - 1 : 0] out
);

    assign out = {in2, in1};
endmodule