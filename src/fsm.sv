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

    // state register
    // this is flip-flop holding the current state
    // the state changes on every rising clk edge
    always_ff @(posedge clk)
        if  (reset) state <= S00;
        else        state <= nextstate;

    // next state logic
    always_comb
        case(state)
            S00:    nextstate = S01;
            S01:    nextstate = S02;
            S02:    nextstate = S00;
            S03:    nextstate = S00;
            S04:    nextstate = S00;
            S05:    nextstate = S00;
            S06:    nextstate = S00;
            S07:    nextstate = S00;
            S08:    nextstate = S00;
            S09:    nextstate = S00;
            S10:    nextstate = S00;
            S11:    nextstate = S00;
            S12:    nextstate = S00;
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