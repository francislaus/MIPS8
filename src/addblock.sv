module addblock (input logic [7:0] a,
                 input logic [7:0] b,
                 input logic cin,
                 output logic [7:0] res);

    assign res = a + b + {7'b0000000, cin};
endmodule