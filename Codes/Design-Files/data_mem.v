/*  
    This module represents a Data Memory with 5 inputs and 2 outputs:
    clk         >> clock signal
    rstn        >> active low asynchronous reset
    WE          >> enable signal for writing 
    A           >> the address used in the writing and the reading processes
    WD          >> the data to be written
    RD          >> the read data
    test_value  >> the value that is in the address 0 in the memory which is
                   used to check if the design works properly or not  
*/

module data_mem #(parameter DATA = 32, ADDR = 32, MEM_DEPTH = 256)(
    input clk, rstn, WE,
    input [ADDR - 1 : 0] A,
    input [DATA - 1 : 0] WD,
    output [DATA - 1 : 0] RD, test_value
);

    reg [DATA - 1 : 0] D_MEM [0 : MEM_DEPTH - 1];

    integer i;
    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            for (i = 0; i < MEM_DEPTH; i = i + 1)
                D_MEM[i] <= 0;
        else if (WE)
            D_MEM[A] <= WD;
    end
    
   assign test_value = D_MEM[0];
   assign RD = D_MEM[A];
endmodule