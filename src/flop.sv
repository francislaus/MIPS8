module flop
    #(parameter width = 8)
    (input logic clk,
     input logic [width-1:0] d,
     output logic [width-1:0] q);

    // standard flip-flop that changes its
    // value on a rising edge of clk
    always_ff @(posedge clk)
        q <= d;

endmodule