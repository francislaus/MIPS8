module aludecoder   (input logic [1:0] aluop,
                     input logic [5:0] funct,
                     output logic [2:0] alucontrol);

    // type for different function codes
    typedef enum logic [5:0]
        {ADD = 6'b100000,
         SUB = 6'b100010,
         AND = 6'b100100,
         OR  = 6'b100101,
         SLT = 6'b101010} functcode;
    
    // case statement that selects the right alucontrol
    // according to the inputs
    always_comb
        case(aluop)
            // addition with immediates
            // which is for the instructions: addi, lb, sb
            2'b00:  alucontrol = 3'b010;
            // subtract for the instruction beq
            2'b01:  alucontrol = 3'b110;
            default:    case (funct)
                            ADD:    alucontrol = 3'b010;
                            SUB:    alucontrol = 3'b110;
                            AND:    alucontrol = 3'b000;
                            OR:     alucontrol = 3'b001;
                            SLT:    alucontrol = 3'b111;
                            // this should never happen
                            // just set it to add
                            default: alucontrol = 3'b010;
                        endcase
        endcase
endmodule