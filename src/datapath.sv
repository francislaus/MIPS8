module datapath (input logic clk,
                 output logic res);

    logic [7:0] d,q;
    flop #(8) f1(clk, d, q);
    assign res = clk;

endmodule