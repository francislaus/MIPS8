#include <verilated.h>

#include "Vprocessor.h"

#include <iostream>
#include <stdio.h>

void print_info(Vprocessor *proc)
{
    printf("IorD: %d\n", proc->processor__DOT__iord);
    printf("IRWrite: %d\n", proc->processor__DOT__irwrite);
    printf("alures: %d\n", proc->processor__DOT__data__DOT__aluresult);
    printf("aluout: %d\n", proc->processor__DOT__data__DOT__aluout);
    printf("state: %d\n", proc->processor__DOT__cont__DOT__fsm_instance__DOT__state);
    printf("srcA: %d\n", proc->processor__DOT__data__DOT__srcA);
    printf("srcB: %d\n", proc->processor__DOT__data__DOT__srcB);
    printf("A: %d\n", proc->processor__DOT__data__DOT__A);
    printf("aluSrcA: %d\n", proc->processor__DOT__alusrcA);

    printf("inst0: %d\n", proc->processor__DOT__data__DOT____Vcellout__inst0_ff____pinNumber4);
    printf("inst1: %d\n", proc->processor__DOT__data__DOT____Vcellout__inst1_ff____pinNumber4);
    printf("inst2: %d\n", proc->processor__DOT__data__DOT____Vcellout__inst2_ff____pinNumber4);
    printf("inst3: %d\n", proc->processor__DOT__data__DOT____Vcellout__inst3_ff____pinNumber4);
    printf("\n\n");
}

void test_add(Vprocessor *top)
{
    top->clk = 0b1;
    top->memdata = 0b00100000;
    top->eval();
    print_info(top);
    top->clk = 0b0;
    top->eval();

    top->clk = 0b1;
    top->memdata = 0b00011000;
    top->eval();
    print_info(top);
    top->clk = 0b0;
    top->eval();

    top->clk = 0b1;
    top->memdata = 0b01000011;
    top->eval();
    print_info(top);
    top->clk = 0b0;
    top->eval();

    top->clk = 0b1;
    top->memdata = 0b00000000;
    top->eval();
    print_info(top);
    top->clk = 0b0;
    top->eval();

    top->memdata = 0b00000000;

    top->clk = 0b1;
    top->eval();
    print_info(top);
    top->clk = 0b0;
    top->eval();

    top->clk = 0b1;
    top->eval();
    printf("HERE\n");
    print_info(top);
    if(top->processor__DOT__data__DOT__aluout == 0b101)
    {
        printf("SUCCESS\n");
    }
    else
    {
        printf("FAILURE\n");
    }
    
}

void test_sub(Vprocessor *top)
{
    top->clk = 0b1;
    top->memdata = 0b00100010;
    top->eval();
    print_info(top);
    top->clk = 0b0;
    top->eval();

    top->clk = 0b1;
    top->memdata = 0b00011000;
    top->eval();
    print_info(top);
    top->clk = 0b0;
    top->eval();

    top->clk = 0b1;
    top->memdata = 0b11100011;
    top->eval();
    print_info(top);
    top->clk = 0b0;
    top->eval();

    top->clk = 0b1;
    top->memdata = 0b00000000;
    top->eval();
    print_info(top);
    top->clk = 0b0;
    top->eval();

    top->memdata = 0b00000000;

    top->clk = 0b1;
    top->eval();
    print_info(top);
    top->clk = 0b0;
    top->eval();

    top->clk = 0b1;
    top->eval();
    printf("HERE\n");
    print_info(top);
    if(top->processor__DOT__data__DOT__aluout == 0b100)
    {
        printf("SUCCESS\n");
    }
    else
    {
        printf("FAILURE\n");
    }
    
}

void init_regs(Vprocessor *top)
{
    // fill the register file with the same number
    // the register number
    top->processor__DOT__data__DOT__regfile_instance__DOT__reg_mem[0] = 0b000;
    top->processor__DOT__data__DOT__regfile_instance__DOT__reg_mem[1] = 0b001;
    top->processor__DOT__data__DOT__regfile_instance__DOT__reg_mem[2] = 0b010;
    top->processor__DOT__data__DOT__regfile_instance__DOT__reg_mem[3] = 0b011;
    top->processor__DOT__data__DOT__regfile_instance__DOT__reg_mem[4] = 0b100;
    top->processor__DOT__data__DOT__regfile_instance__DOT__reg_mem[5] = 0b101;
    top->processor__DOT__data__DOT__regfile_instance__DOT__reg_mem[6] = 0b110;
    top->processor__DOT__data__DOT__regfile_instance__DOT__reg_mem[7] = 0b111;
}


int main(int argc, char **argv)
{
    Verilated::commandArgs(argc, argv);
    Vprocessor *top = new Vprocessor;
    top->reset = 0b0;

    /*init_regs(top);
    test_add(top);*/

    /*top->reset = 0b1;
    top->eval();*/
    top->reset = 0b0;

    init_regs(top);
    test_sub(top);

    top->final();

    delete top;

    exit(0);
}