%include {
    #include <stdio.h>
    #include <assert.h>
    #include <stdint.h>
    #include "compiler.h"
    #include "instructions.h"
    #include "keywords.h"
    #include "symtab.h"
    #include "scope.h"
    #include "tokens.h"
}

%extra_argument { scope_t* scope }

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

%token_destructor { free_tokens(1, $$); }

start    ::= exprlist.
exprlist ::= expr.
exprlist ::= expr NEWLINE exprlist.

/* keywords: define */
expr ::= KEYWORD(A) SYMBOL(B). {
    keyword(A, B, NULL, scope);
    free_tokens(2, A, B);
}

/* keywords: define = expr */
expr ::= KEYWORD(A) SYMBOL(B) ASSIGN NUM_8(C). {
    keyword(A, B, &C, scope);
    free_tokens(3, A, B, C);
}

/* instruction direct mode */
expr ::= INSTR(A). {
    instruction(A, NULL, 0);
    free_tokens(1, A);
}

/* instruction immediate mode */
expr ::= INSTR(A) HASH NUM_8(B). {
    instr_immediate(A, B);
    free_tokens(2, A, B);
}

/* macros no args */
/*expr ::= MFOR(A). {
    macro(A, NULL);
}*/

expr ::= LPAREN expr RPAREN.
expr ::= .
