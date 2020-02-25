module mux2 (input logic [7:0] d0, d1,
             input logic s,
             output logic [7:0] res);

            // this is a 2:1 multiplexer

    assign res = s ? d0 : d1;
endmodule