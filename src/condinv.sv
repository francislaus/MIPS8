module condinv  (input logic [7:0] a,
                 input logic inv,
                 output logic [7:0] res);
                
    // invert a if inv == 1
    assign res = inv ? ~a : a;
endmodule