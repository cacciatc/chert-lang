#include <stdint.h>
#include <stdio.h>

#include "instructions.h"
#include "compiler.h"
#include "parser.h"
#include "common.h"

#define MAX_INSTR_SZ 256

opcode_t opcode_table[] = {
    { LDA, "lda", IMMEDIATE | ZERO_PAGE },
    { LDX, "ldx", IMMEDIATE | ZERO_PAGE },
    { LDY, "ldy", IMMEDIATE | ZERO_PAGE },
    { STA, "sta", IMMEDIATE | ZERO_PAGE },
    { STX, "stx", IMMEDIATE | ZERO_PAGE },
    { STY, "sty", IMMEDIATE | ZERO_PAGE }
};

char code[MAX_INSTR_SZ];

/* Parses an instruction with immediate operands. */
void instr_immediate(token_t token, token_t* args, uint8_t argc) {
    opcode_t op;
    
    op = opcode_table[token.lval];
    
    /* only one arg for immediate */
    sprintf(code, "%s #%hu\n", op.name, (args + 0)->lval);
    printf("%s", code); 
}
