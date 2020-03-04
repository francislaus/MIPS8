#include <verilated.h>

#include "Valu.h"

#include <iostream>
#include <stdio.h>

int main(int argc, char** argv){
    Verilated::commandArgs(argc, argv);
    Valu* top = new Valu;
    while(!Verilated::gotFinish()){

        /*
        Test the and function
        The result of 0b01010101 and 0b00001111
        should be 0b00000101
        */

        top->alucontrol = 0b000;
        top->a = 0b01010101;
        top->b = 0b00001111;
        // evaluate the result
        top->eval();

        // printf("alures = %d\n",top->aluresult);

        if(top->aluresult == 0b00000101){
            printf("AND - Passed\n");
        }
        else{
            printf("AND - Failed\n");
        }


        /*
        Test the or function
        The result of 0b01010101 or 0b00001111
        should be 0b01011111
        */

        top->alucontrol = 0b001;
        top->a = 0b01010101;
        top->b = 0b00001111;
        // evaluate the result
        top->eval();

        // printf("alures = %d\n",top->aluresult);

        if(top->aluresult == 0b01011111){
            printf("OR - Passed\n");
        }
        else{
            printf("OR - Failed\n");
        } 

        /*
        Test the add function
        The result of 0b01010101 + 0b00001111
        should be 0b01100100
        */

        top->alucontrol = 0b010;
        top->a = 0b01010101;
        top->b = 0b00001111;
        // evaluate the result
        top->eval();

        // printf("alures = %d\n",top->aluresult);

        if(top->aluresult == 0b01100100){
            printf("ADD - Passed\n");
        }
        else{
            printf("ADD - Failed\n");
        }

        /*
        Test the sub function
        The result of 0b01010101 - 0b00001111
        should be 0b01000110
        */

        top->alucontrol = 0b110;
        top->a = 0b01010101;
        top->b = 0b00001111;
        // evaluate the result
        top->eval();

        // printf("alures = %d\n",top->aluresult);

        if(top->aluresult == 0b01000110){
            printf("SUB - Passed\n");
        }
        else{
            printf("SUB - Failed\n");
        }

        /*
        Test the slt function
        The result of 0b01010101 slt 0b00001111
        should be 0b00000000
        */

        top->alucontrol = 0b111;
        top->a = 0b01010101;
        top->b = 0b00001111;
        // evaluate the result
        top->eval();

        // printf("alures = %d\n",top->aluresult);

        if(top->aluresult == 0b00000000){
            printf("SLT0 - Passed\n");
        }
        else{
            printf("SLT0 - Failed\n");
        }

        /*
        Test the slt function
        The result of 0b00001111 slt 0b01010101
        should be 0b00000001
        */

        top->alucontrol = 0b111;
        top->a = 0b00001111;
        top->b = 0b01010101;
        // evaluate the result
        top->eval();

        // printf("alures = %d\n",top->aluresult);

        if(top->aluresult == 0b00000001){
            printf("SLT1 - Passed\n");
        }
        else{
            printf("SLT1 - Failed\n");
        }



        // print the current state if there
        // is has changed (only if clk is 1)
        /*if(top->clk){
            printf("%d\n",top->pcwrite);
        }*/


    }

    top->final();

    delete top;

    exit(0);
}