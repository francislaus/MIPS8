module alu  (input logic [2:0] alucontrol,
             input logic [7:0] a, b,
             output logic [7:0] aluresult,
             output logic zero);

    /*
    The design of the alu is as follows:
    All possible functions are computed concurrently.
    Afer that step the result that is actually needed
    gets selected by a multiplexer
    Possible functions are:
    - addition
    - subtraction
    - and
    - or
    - set less than
    */

    // results of the different blocks
    logic [7:0] andres, orres, sumres, sltres;
    // value of b that gets conditionally inverted
    logic [7:0] binv;

    andblock anb(a, b, andres);
    orblock ob(a, b, orres);
    condinv ci(b, alucontrol[2], binv);
    addblock adb(a, binv, alucontrol[2], sumres);
    // slt is 1 if the msb of the sum is 1
    assign sltres = {7'b0000000, sumres[7]};

    // select the needed output
    mux4 mu(andres, orres, sumres, sltres, alucontrol[1:0], aluresult);

    // set the zero line
    zeromark zm(aluresult, zero);

endmodule