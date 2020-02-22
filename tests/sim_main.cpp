#include <verilated.h>

#include "Vsimple_top.h"

int main(int argc, char** argv){
    Verilated::commandArgs(argc, argv);
    Vsimple_top* top = new Vsimple_top;
    while(!Verilated::gotFinish()){
        top->eval();
    }

    top->final();

    delete top;

    exit(0);
}