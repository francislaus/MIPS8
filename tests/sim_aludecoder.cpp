#include <verilated.h>

#include "Valudecoder.h"

#include <iostream>
#include <stdio.h>

int main(int argc, char** argv){
    Verilated::commandArgs(argc, argv);
    Valudecoder* top = new Valudecoder;
    while(!Verilated::gotFinish()){
        // here we test three input combinations

        // test addi
        top->aluop = 0b00;
        top->eval();
        // we expect the output 010
        printf("ADDI: %d\n", (top->alucontrol == 0b010));

        // test and
        top->aluop = 0b10;
        top->funct = 0b100100;
        top->eval();
        // we expect the output 000
        printf("AND: %d\n", (top->alucontrol == 0b000));

        // test slt
        top->aluop = 0b10;
         top->funct = 0b101010;
        top->eval();
        // we expect the output 010
        printf("SLT: %d\n", (top->alucontrol == 0b111));
    }

    top->final();

    delete top;

    exit(0);
}