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
%type NEWLINE   { token_t }
%type OPCODE    { token_t }
%type MFOR      { token_t }
%type expr      { token_t }

start    ::= exprlist.
exprlist ::= expr.
exprlist ::= expr NEWLINE exprlist.

/* arithmetic */
//expr ::= expr MINUS expr.
//expr ::= expr PLUS expr.
//expr ::= expr TIMES expr.
//expr ::= expr DIVIDES expr.

/* opcodes no args */
expr ::= OPCODE(A). {
    build_expr(A, NULL);
}

/* macros no args */
expr ::= MFOR(A). {
    macro(A, NULL);
}

expr ::= BYTE NUM.
expr ::= WORD NUM.
expr ::= LPAREN expr RPAREN.
expr ::= .
