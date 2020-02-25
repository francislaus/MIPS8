module flop_en
    #(parameter width = 8)
    (input logic clk,
     input logic en,
     input logic [width-1:0] d,
     output logic [width-1:0] q);

    // flip-flop that changes its value on a rising
    // edge of clk only if en == 1
    always_ff @(posedge clk)
        if(en)  q <= d;

endmodule