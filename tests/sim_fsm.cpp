#include <verilated.h>

#include "Vfsm.h"

#include <iostream>
#include <stdio.h>

int main(int argc, char **argv)
{
    Verilated::commandArgs(argc, argv);
    Vfsm *top = new Vfsm;

    // the rest signal is zero the entire time
    top->reset = 0;

    /*
    Here we test some of the state transitions
    This is not exhaustive testing!
    */

    // First we test the four instruction
    // fetching states, which need to occur
    // in this order: 0, 1, 2, 3

    // S00
    if (top->fsm__DOT__state != 0b0)
    {
        printf("FAIL\n");
    }

    // S01
    top->clk = 0b1;
    top->eval();
    if (top->fsm__DOT__state != 0b1)
    {
        printf("FAIL\n");
    }
    top->clk = 0b0;
    top->eval();

    // S02
    top->clk = 0b1;
    top->eval();
    if (top->fsm__DOT__state != 0b10)
    {
        printf("FAIL\n");
    }
    top->clk = 0b0;
    top->eval();

    // S03
    top->clk = 0b1;
    top->eval();
    if (top->fsm__DOT__state != 0b11)
    {
        printf("FAIL\n");
    }
    top->clk = 0b0;
    top->eval();

    /*
    Now we test a long trace in the FSM
    If the action is LB, the states need to
    occur in the following order: 4, 5, 8, 0
    */

    // S04
    top->op_code = 0b101000;
    top->clk = 0b1;
    top->eval();
    if (top->fsm__DOT__state != 0b100)
    {
        printf("FAIL\n");
    }
    top->clk = 0b0;
    top->eval();

    // S05
    top->clk = 0b1;
    top->eval();
    if (top->fsm__DOT__state != 0b101)
    {
        printf("FAIL\n");
    }
    top->clk = 0b0;
    top->eval();

    // S08
    top->clk = 0b1;
    top->eval();
    if (top->fsm__DOT__state != 0b1000)
    {
        printf("FAIL\n");
    }
    top->clk = 0b0;
    top->eval();

    // S00
    top->clk = 0b1;
    top->eval();
    if (top->fsm__DOT__state != 0b0)
    {
        printf("FAIL\n");
    }
    top->clk = 0b0;
    top->eval();


    top->final();

    delete top;

    exit(0);
}