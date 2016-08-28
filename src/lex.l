%{
    #include "parser.h"
    #include "compiler.h"
%}

%option noyywrap

DIGIT   [0-9]
%%

                                /* opcodes */
(?i:lda)                        { return INSTR; }
(?i:ldx)                        { return INSTR; }
(?i:ldy)                        { return INSTR; }

(?i:sta)                        { return INSTR; }
(?i:stx)                        { return INSTR; }
(?i:sty)                        { return INSTR; }

                                /* macros */
(?i:mfor)                       { return MACRO; }

{DIGIT}+                        { next_token.lval = atoi(yytext); return NUM; }
("0x"|"0X"){DIGIT}+             { next_token.lval = strtol(yytext, NULL, 16); return NUM; }
("b"|"B"){DIGIT}+               { next_token.lval = strtol(yytext, NULL, 2);  return NUM; }

"("                             { return LPAREN; }
")"                             { return RPAREN; }
"{"                             { return LCURLY; }
"}"                             { return RCURLY; }

\n                              { return NEWLINE; }
[ \t]+                          { /* eat whitespace */ }
";".*                           { /* eat up one line comments */ }

%%
