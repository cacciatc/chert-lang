#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <stdint.h>

#include "compiler.h"
#include "parser.h"
#include "parser.c"
#include "scanner.h"

void print_token(token_t token) {
    printf("token: lval = %d, text = %s, code = %d\n", 
        token.lval, token.text, token.code);
}

void lookup_opcode(int16_t code, opcode_t *op) {
}

void emit_opcode(opcode_t *op, token_t* args, uint8_t argc) {
}

void instruction(token_t instr, token_t* args, uint8_t argc) {
    opcode_t op;
print_token(instr);
    /* lookup op */
    lookup_opcode(instr.code, &op);

    /* lookup symbols if needed */

    /* emit */
    emit_opcode(&op, args, argc);
}

void macro(token_t expr, token_t* args) {
    print_token(expr);
}

void compile(const char* fname) {
    /* open input file */
    yyin = fopen(fname, "r");
    if(!yyin) {
        fprintf(stderr, "Unable to open %s for compilation:\n\t%s", 
            fname, strerror(errno));
        exit(EXIT_FAILURE);
    }

    token_t token;
    void*   parser;

    /* init parser */
    parser = ParseAlloc(malloc);

    do {
        /* get next code */
        token.code  = yylex();
        token.text  = yytext;
        token.lval  = next_token.lval;

        /* parse token */
        Parse(parser, token.code, token);
    } while(token.code > 0);

    /* TODO: better scanner error output */
    if(token.code == -1) {
        fprintf(stderr, "Scanner encountered a problem.\n");
    }

    /* close input file */
    if(yyin) {
        fclose(yyin);
    }

    /* cleanup parser */
    ParseFree(parser, free);
}
