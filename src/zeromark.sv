module zeromark (input logic [7:0] in,
                 output logic res);

    // checks wether the input is 0
    // if in == 0 then res = 1
    // otherwise res = 0
    assign res = (in == 8'b00000000);
endmodule