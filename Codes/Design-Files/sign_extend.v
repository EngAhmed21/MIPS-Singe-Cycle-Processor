module sign_extend #(parameter INPU_WIDTH = 16, OUTPUT_WIDTH = 32)(
    input [INPU_WIDTH - 1 : 0] in,
    output  [OUTPUT_WIDTH - 1 : 0] out
);

    assign out = {{(OUTPUT_WIDTH - INPU_WIDTH){in[INPU_WIDTH - 1]}}, in};
endmodule
