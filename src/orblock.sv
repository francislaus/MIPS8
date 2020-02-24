module orblock (input logic [7:0] a,
                 input logic [7:0] b,
                 output logic [7:0] res);

    // apply a simple or operation
    assign res = a | b;
endmodule