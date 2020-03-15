module mux2
    #(parameter width = 8)
    (input logic [width-1:0] d0, d1,
     input logic s,
     output logic [width-1:0] res);

    // this is a 2:1 multiplexer

    // implemented by a case statement
    always_comb
        case(s)
            1'b0:  res = d0;
            1'b1:  res = d1;
            // all cases are covered
            // no default needed
        endcase
endmodule