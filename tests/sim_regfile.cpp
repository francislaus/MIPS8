#include <verilated.h>

#include "Vregfile.h"

#include <iostream>
#include <stdio.h>

int main(int argc, char** argv){
    Verilated::commandArgs(argc, argv);
    Vregfile* top = new Vregfile;
    while(!Verilated::gotFinish()){

        /*
        We will test two cases here:
        1. we will write to the zero register and
        the expected result is no change
        2. we will write to s1 and the expected
        result is the written value
        */

        // test case 1
        top->clk = 0b1;
        top->we = 0b1;
        top->wd1 = 0b10101010;
        top->wa1 = 0b00000;
        top->eval();
        top->clk = 0b0;
        top->eval();
        top->ra1 = 0b00000;
        top->eval();
        printf("rd1 = %d\n", top->rd1);

        // test case 2
        top->clk = 0b1;
        top->we = 0b1;
        top->wd1 = 0b10101010;
        top->wa1 = 0b00001;
        top->eval();
        top->clk = 0b0;
        top->eval();
        top->ra1 = 0b00001;
        top->eval();
        printf("rd1 = %d\n", top->rd1);
    }

    top->final();

    delete top;

    exit(0);
}