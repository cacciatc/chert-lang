#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <stdint.h>

#include "compiler.h"
#include "parser.c"
#include "scanner.h"

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