%{
    #include "parser.h"
    #include "compiler.h"
    #include "instructions.h"
%}

%option noyywrap

DIGIT   [0-9]
HEX_DIGIT ([0-9]|[A-F]|[a-f])
BIN_DIGIT [0-1]
%%

                                /* opcodes */
(?i:lda)                        { next_token.lval = LDA; return INSTR; }
(?i:ldx)                        { next_token.lval = LDX; return INSTR; }
(?i:ldy)                        { next_token.lval = LDY; return INSTR; }

(?i:sta)                        { next_token.lval = STA; return INSTR; }
(?i:stx)                        { next_token.lval = STX; return INSTR; }
(?i:sty)                        { next_token.lval = STY; return INSTR; }

                                /* macros */
(?i:mfor)                       { return MACRO; }

{DIGIT}{1,2}                    { next_token.lval = atoi(yytext);             return NUM_8; }
("0x"|"0X"){HEX_DIGIT}{1,2}     { next_token.lval = strtol(yytext, NULL, 16); return NUM_8; }
("b"|"B"){BIN_DIGIT}{8,8}       { next_token.lval = strtol(yytext, NULL, 2);  return NUM_8; }

"("                             { return LPAREN; }
")"                             { return RPAREN; }
"{"                             { return LCURLY; }
"}"                             { return RCURLY; }
"#"                             { return HASH;   }

\n                              { return NEWLINE; }
[ \t]+                          { /* eat whitespace */ }
";".*                           { /* eat up one line comments */ }

%%
