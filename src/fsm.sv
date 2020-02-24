/*
Name: fsm.sv
Author: Franz Fuchs
Purpose: implement the finite state machine model
         of the CPU
*/

module cu   (input  logic clk,
             input  logic reset,
             output logic memtoreg,
             output logic memwrite,
             output logic regdst,
             output logic iord,
             output logic pcwrite,
             output logic branch,
             output logic alusrcA,
             output logic regwrite,
             output logic [1:0] pcsrc,
             output logic [1:0] alusrcB,
             output logic [1:0] aluop,
             output logic [2:0] alucontrol,
             output logic [3:0] irwrite);

    // define own state type
    // currently 16 different states possible
    // only 12 are used though
    typedef enum logic [3:0]
        {S00, S01, S02, S03, S04, S05, S06, S07, S08,
         S09, S10, S11, S12} statetype;
    statetype state, nextstate;

    // define own type for different instructions
    typedef enum logic [5:0]
        {LB = 6'b100000,
         SB = 6'b101000,
         BEQ = 6'b000100,
         J = 6'b000010,
         RTYPE = 6'b000000} opcode;

    opcode op;

    // state register
    // this is flip-flop holding the current state
    // the state changes on every rising clk edge
    always_ff @(posedge clk)
        if  (reset) state <= S00;
        else        state <= nextstate;

    // next state logic
    always_comb
        case(state)
            // initial state: here the first 8 bits are fetched
            // go to the next instruction fetching state
            S00:    nextstate = S01;
            // second byte fetching state
            // go to the next instruction fetching state
            S01:    nextstate = S02;
            // third byte fetching state
            // go to the next instruction fetching state
            S02:    nextstate = S03;
            // fourth byte fetching state
            // always go to S04
            S03:    nextstate = S04;
            // change to other states depending on opcode
            S04:    case(op)
                        LB:     nextstate = S05;
                        SB:     nextstate = S05;
                        RTYPE:  nextstate = S09;
                        BEQ:    nextstate = S11;
                        J:      nextstate = S12;
                        // this should never happen
                        default:    nextstate = S00;
                    endcase
            // change to other states depending on opcode
            S05:    case(op)
                        LB:     nextstate = S06;
                        SB:     nextstate = S08;
                        // should never happen
                        default:    nextstate = S00;
                    endcase
            // always go to state S07
            S06:    nextstate = S07;
            // instruction finished
            // go back to initial state
            S07:    nextstate = S00;
            // instruction finished
            // go back to initial state
            S08:    nextstate = S00;
            // always go to state S10
            S09:    nextstate = S10;
            // instruction finished
            // go back to initial state
            S10:    nextstate = S00;
            // instruction finished
            // go back to initial state
            S11:    nextstate = S00;
            // instruction finished
            // go back to initial state
            S12:    nextstate = S00;
            // should never happen
            default: nextstate = S00;
        endcase

    // output logic
    always_comb
        // initialize all outputs to zero and then set
        // the changed ones accordingly
        begin
            memtoreg = 0;
            memwrite = 0;
            regdst = 0;
            iord = 0;
            pcwrite = 0;
            branch = 0;
            alusrcA = 0;
            regwrite = 0;
            pcsrc = 2'b00;
            alusrcB = 2'b00;
            aluop = 2'b00;
            alucontrol = 3'b000;
            irwrite = 4'b0000;
            case(state)
                S00:    begin
                            alusrcB = 2'b01;
                            pcwrite = 1;
                            irwrite = 4'b0001;
                        end
                S01:    begin
                            alusrcB = 2'b01;
                            pcwrite = 1;
                            irwrite = 4'b0010;
                        end
                S02:    begin
                            alusrcB = 2'b01;
                            pcwrite = 1;
                            irwrite = 4'b0100;
                        end
                S03:    begin
                            alusrcB = 2'b01;
                            pcwrite = 1;
                            irwrite = 4'b1000;
                        end
                S04:    begin
                            alusrcB = 2'b11;
                            alusrcA = 1;
                        end
                S05:    begin
                            alusrcB = 2'b10;
                            alusrcA = 1;
                        end
                S06:    begin
                            iord = 1;
                        end
                S07:    begin
                            regwrite = 1;
                            memtoreg = 1;
                        end
                S08:    begin
                            memwrite = 1;
                            iord = 1;
                        end
                S09:    begin
                            alusrcA = 1;
                            aluop = 2'b10;
                        end
                S10:    begin
                            regdst = 1;
                            regwrite = 1;
                        end
                S11:    begin
                            alusrcA = 1;
                            aluop = 2'b01;
                            branch = 1;
                            pcsrc = 2'b01;
                        end
                S12:    begin
                            pcwrite = 1;
                            pcsrc = 2'b10;
                        end
                default:    pcwrite = 0;
            endcase
        end

endmodule 