%include {
    #include <stdio.h>
    #include <assert.h>
    #include <stdint.h>
    #include "compiler.h"
    #include "instructions.h"
    #include "keywords.h"
    #include "symtab.h"
}

%extra_argument { symtab_t* symbols }

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
%type NUM       { token_t }
%type SYMBOL    { token_t }
%type KEYWORD   { token_t }

start    ::= exprlist.
exprlist ::= expr.
exprlist ::= expr NEWLINE exprlist.

/* keywords: define */
expr ::= KEYWORD(A) SYMBOL(B). {
    keyword(A, B, NULL, symbols);
}

/* keywords: define = expr */
expr ::= KEYWORD(A) SYMBOL(B) ASSIGN NUM_8(C). {
    keyword(A, B, &C, symbols);
}

/* instruction direct mode */
expr ::= INSTR(A). {
    instruction(A, NULL, 0);
}

/* instruction immediate mode */
expr ::= INSTR(A) HASH NUM_8(B). {
    instr_immediate(A, B);
}

/* macros no args */
/*expr ::= MFOR(A). {
    macro(A, NULL);
}*/

expr ::= LPAREN expr RPAREN.
expr ::= .
