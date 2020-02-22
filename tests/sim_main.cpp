#include <verilated.h>

#include "Vfsm.h"

#include <iostream>

int main(int argc, char** argv){
    Verilated::commandArgs(argc, argv);
    Vfsm* top = new Vfsm;
    while(!Verilated::gotFinish()){
        top->clk = top->clk ^ 1;
        top->eval();
        if(top->cu_out == 2){
            std::cout << "2\n"; 
        }
        else{
            std::cout << "else\n";
        }
    }

    top->final();

    delete top;

    exit(0);
}