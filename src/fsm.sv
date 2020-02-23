/*
Name: fsm.sv
Author: Franz Fuchs
Purpose: implement the finite state machine model
         of the CPU
*/

module cu   (input  logic clk,
             input  logic reset,
             output logic [1:0] cu_out);

    // define own state type
    // currently 16 different states possible
    // only 12 are used though
    typedef enum logic [3:0]
        {S00, S01, S02, S03, S04, S05, S06, S07, S08,
         S09, S10, S11, S12} statetype;
    statetype state, nextstate;

    // define own type for different instructions
    typedef enum logic [6:0]
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
    always @(posedge clk)
        case(state)
            S00:    begin
                        cu_out <= 0;
                    end
            S01:    begin
                        cu_out <= 1;
                    end
            S02:    begin
                        cu_out <= 2;
                    end
            default:    cu_out <= 0;
        endcase

endmodule 