%{
    #include "parser.h"
    #include "compiler.h"
%}

%option noyywrap

DIGIT   [0-9]
DECIMAL DIGIT+
HEX     0(x|X)(DIGIT|A-F|a-f)+
BIN     (B|b)[0-1]+
%%

                                /* opcodes */
(?i:lda|ldx|ldy)                { return OPCODE; }
(?i:sta|stx|sty)                { return OPCODE; }

DIGIT+                          { token.lval = atoi(yytext); return NUM; }

"("                             { return LPAREN; }
")"                             { return RPAREN; }

\n                              { return NEWLINE; }
[ \t]+                          { /* eat whitespace */ }
";".*                           { /* eat up one line comments */ }

%%
