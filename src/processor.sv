module processor    (input logic clk,
                     input logic reset,
                     input logic [7:0] memdata,
                     output logic memread,
                     output logic memwrite,
                     output logic [7:0] adr,
                     output logic [7:0] writedata);

    // instruction register
    logic [31:0] instr;

    // signals for the controller
    logic iord, alusrcA, zero, regwrite, memtoreg,
          regdst, pcen;
    logic [1:0] pcsrc, alusrcB;
    logic [2:0] alucontrol;
    logic [3:0] irwrite;
    logic [5:0] funct, op;

    // assign the values
    assign funct = instr[5:0];
    assign op = instr[31:26];

    // the processor is the top layer and instantiates
    // the two main modules which is the controller and
    // and the datapath

    // instantiate the controller
    controller cont(clk, reset, zero, op, funct, memread,
                    memtoreg, memwrite, iord, alusrcA,
                    regwrite, regdst, pcen, alusrcB, pcsrc,
                    alucontrol, irwrite);

    // instantiate the datapath
    datapath data(clk, reset, memwrite, pcen, iord, alusrcA,
                  memtoreg, regdst, regwrite, pcsrc, alusrcB,
                  alucontrol, irwrite, memdata, zero,
                  instr, adr, writedata);



endmodule