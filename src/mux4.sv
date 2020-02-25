module mux4
    #(parameter width = 8)
    (input logic [width-1:0] d0, d1, d2, d3,
     input logic [1:0] s,
     output logic [width-1:0] res);

    // this is a 4:1 multiplexer
    // implemented by a case statement
    always_comb
        case(s)
            2'b00:  res = d0;
            2'b01:  res = d1;
            2'b10:  res = d2;
            2'b11:  res = d3;
            // all cases are covered
            // no default needed
        endcase
endmodule