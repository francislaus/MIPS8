module mux2
    #(parameter width = 8)
    (input logic [width-1:0] d0, d1,
     input logic s,
     output logic [width-1:0] res);

            // this is a 2:1 multiplexer

    assign res = s ? d0 : d1;
endmodule