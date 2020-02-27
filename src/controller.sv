module controller   (input logic clk,
                     input logic reset,
                     input logic zero,
                     output logic pcen);

    logic pcwrite, branch;
    logic [1:0] aluop;

    // logic for pcen
    assign pcen = pcwrite | (branch & zero);

    // the final state machine
    //fsm fsm_instance(clk, reset,...);

endmodule