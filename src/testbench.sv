module testbench(input logic xy);

    logic clk, reset, memwrite, memread;
    logic [7:0] adr, writedata, readdata;

    processor proc  (clk, reset, readdata, memread,
                     memwrite, adr, writedata);

    externmemory mem(clk, memwrite, adr, writedata,
                     readdata);

endmodule