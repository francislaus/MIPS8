module andblock (input logic [7:0] a,
                 input logic [7:0] b,
                 output logic [7:0] res);

    // apply a simple and operation
    assign res = a & b;
endmodule