module D_FF #(parameter WIDTH = 4)(
    input clk, rstn,
    input [WIDTH - 1 : 0] D,
    output reg [WIDTH - 1 : 0] Q
);

    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            Q <= 0;
        else
            Q <= D;
    end
endmodule