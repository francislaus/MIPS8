module regfile  (input logic clk,
                 input logic we,
                 input logic [4:0] ra1, ra2,
                 input logic [4:0] wa1,
                 input logic [7:0] wd1,
                 output logic [7:0] rd1, rd2);

    /*
    This module allows two concurrent reads,
    which is needed if instructions require
    two source registers
    Also one write per clock cycle is possible.
    Note that writes are only done if the
    write-enable (we) input signal is 1.
    */

    // there are 32 possible registers, but we
    // do not use all of them
    logic [7:0] reg_mem [31:0];

    always @(posedge clk)
        // it is not allowed to write to register 00000
        // as this register is the zero register
        if(we & (wa1 != 5'b00000))  reg_mem[wa1] <= wd1;
    
    assign rd1 = (ra1 != 5'b00000) ? reg_mem[ra1] : 8'b00000000;
    assign rd2 = (ra2 != 5'b00000) ? reg_mem[ra2] : 8'b00000000;

endmodule