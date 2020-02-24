#include <verilated.h>

#include "Vfsm.h"

#include <iostream>
#include <stdio.h>

int main(int argc, char** argv){
    Verilated::commandArgs(argc, argv);
    Vfsm* top = new Vfsm;
    while(!Verilated::gotFinish()){
        top->clk = top->clk ^ 1;
        top->eval();
        // print the current state if there
        // is has changed (only if clk is 1)
        if(top->clk){
            printf("%d\n",top->pcwrite);
        }
    }

    top->final();

    delete top;

    exit(0);
}