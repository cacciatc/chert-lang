%include {
    #include <stdio.h>
    #include <assert.h>
    #include <stdint.h>
    #include "compiler.h"
}

%token_type { token_t }

%syntax_error {
    fprintf(stderr, "Syntax error!\n");
}

%type NUM       { token_t }
%type BYTE      { token_t }
%type WORD      { token_t }
%type SEMICOLON { token_t }
%type expr      { token_t }

start ::= expr.

/* arithmetic */
//expr ::= expr MINUS expr.
//expr ::= expr PLUS expr.
//expr ::= expr TIMES expr.
//expr ::= expr DIVIDES expr.

expr ::= BYTE NUM.
expr ::= WORD NUM.
expr ::= SEMICOLON.
expr ::= LPAREN expr RPAREN.
expr ::= .
