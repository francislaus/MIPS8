module datapath (input logic clk,
                 input logic reset,
                 input logic memwrite,
                 input logic pcen,
                 input logic iord,
                 input logic alusrcA,
                 input logic [1:0] pcsrc,
                 input logic [3:0] irwrite,
                 input logic [7:0] memdata,
                 output logic [31:0] instr,
                 output logic [7:0] writedata);

    logic [4:0] ra1, ra2, wa1;

    logic [7:0] aluout, aluresult, zero, immx4,
                imm, pc,pcnext, adr, rd1, rd2,
                A, srcA, data;

    // pc flip flop
    // this has to be resettable
    flop_enr pc_ff(clk, pcen, reset, pcnext, pc);

    // flip flops for the instruction register
    flop_en inst0_ff(clk, irwrite[0], memdata, instr[7:0]);
    flop_en inst1_ff(clk, irwrite[1], memdata, instr[15:8]);
    flop_en inst2_ff(clk, irwrite[2], memdata, instr[23:16]);
    flop_en inst3_ff(clk, irwrite[3], memdata, instr[31:24]);

    // flip-flop for data
    flop data_ff(clk, memdata, data);

    // flip-flop for alu result
    flop alu_ff(clk, aluresult, aluout);

    //flip-flops for read regiser values
    flop rd1_ff(clk, rd1, A);
    flop rd2_ff(clk, rd2, writedata);


    // 2:1 multiplexer for pc or memory address
    mux2 srca_mux(pc, aluout, iord, adr);

    // 2:1 multiplexer for a or pc
    mux2 pc_mux(pc, A, alusrcA, srcA);

    // 3:1 multiplexer of alu output
    // we use the mux4 module and put
    // immx4 on the not used output pin
    mux4 alu_mux(aluresult, aluout, immx4, immx4, pcsrc, pcnext);

endmodule