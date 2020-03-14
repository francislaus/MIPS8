module externmemory (input logic clk,
                     input logic memwrite,
                     input logic [7:0] adr,
                     input logic [7:0] writedata,
                     output logic [7:0] readdata);

    /*
    This is the external memory for the processor
    Here both instructions and data are stored
    */

    // 256 bytes (1KB)
    logic [7:0] mem [255:0];

    // writes occur on every rising edge of clk
    always_ff @(posedge clk)
        if (memwrite)
            mem[adr] <= writedata;

    // reads are handled immediately
    always_comb
        readdata = mem[adr];

endmodule