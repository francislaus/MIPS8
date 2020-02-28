module controller   (input logic clk,
                     input logic reset,
                     input logic zero,
                     input logic [5:0] op,
                     input logic [5:0] funct,
                     output logic memread,
                     output logic memtoreg,
                     output logic memwrite,
                     output logic iord,
                     output logic alusrcA,
                     output logic regwrite,
                     output logic regdst,
                     output logic pcen,
                     output logic [1:0] alusrcB,
                     output logic [1:0] pcsrc,
                     output logic [2:0] alucontrol,
                     output logic [3:0] irwrite);

    logic pcwrite, branch;
    logic [1:0] aluop;

    // logic for pcen
    assign pcen = pcwrite | (branch & zero);

    // the final state machine
    fsm fsm_instance(clk, reset, memtoreg, memwrite, regdst,
                    iord, pcwrite, branch, alusrcA, regwrite,
                    pcsrc, alusrcB, aluop, alucontrol, irwrite);

    // the decoder for the alu
    aludecoder aludec(aluop, funct, alucontrol);

endmodule