%include {
    #include <stdio.h>
    #include <assert.h>
    #include <stdint.h>
    #include "compiler.h"
    #include "instructions.h"
}

%token_type { token_t }

%syntax_error {
    fprintf(stderr, "Syntax error!\n");
}

%type BYTE      { token_t }
%type WORD      { token_t }
%type SEMICOLON { token_t }
%type NEWLINE   { token_t }
%type MFOR      { token_t }
%type MACRO     { token_t }
%type RCURLY    { token_t }
%type LCURLY    { token_t }
%type expr      { token_t }
%type NUM       { token_t }

start    ::= exprlist.
exprlist ::= expr.
exprlist ::= expr NEWLINE exprlist.

/* instruction direct mode */
expr ::= INSTR(A) NEWLINE. {
    instruction(A, NULL, 0);
}

/* instruction immediate mode */
expr ::= INSTR(A) HASH NUM_8(B). {
    instr_immediate(A, &B, 1);
}

/* macros no args */
/*expr ::= MFOR(A). {
    macro(A, NULL);
}*/

//expr ::= BYTE NUM.
//expr ::= WORD NUM.
expr ::= LPAREN expr RPAREN.
expr ::= .
