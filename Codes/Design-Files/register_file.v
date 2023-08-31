/*  
    This module represents a register file with 7 inputs and 2 outputs:
    clk      >> clock signal
    rstn     >> active low asynchronous reset
    WE       >> enable signal for writing in the register file through the address WA and the data WD
    RA1      >> the address of the register whose data will be output in RD1
    RA2      >> the address of the register whose data will be output in RD2
    WA       >> the address of the location to write in
    WD       >> the data that will be writed in the address WA in the register file
    RD1, RD2 >> the data read from the register file 
*/

module register_file #(parameter DATA = 32, ADDR = 5)(
    input clk, rstn, WE,
    input [ADDR - 1 : 0] RA1, RA2, WA,
    input [DATA - 1 : 0] WD,
    output [DATA - 1 : 0] RD1,RD2 
);

    // Register file
    reg [DATA - 1 : 0] reg_file [0 : (2 ** ADDR) - 1];

    // Writing
    integer i;
    always @(posedge clk, negedge rstn) begin
        if (!rstn)
            for (i = 0; i < 2 ** ADDR; i = i + 1) 
                reg_file[i] <= 0;
        else if (WE)
            reg_file[WA] <= WD;
    end

    // Reading 
    assign RD1 = reg_file[RA1];
    assign RD2 = reg_file[RA2];
endmodule