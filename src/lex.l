%{
    #include "parser.h"
    #include "compiler.h"
%}

%option noyywrap

%%

module|end                      { } 

[0-9]+                          { token.lval = atoi(yytext); return NUM; }

"("                             { return LPAREN; }
")"                             { return RPAREN; }

[ \t\n]+                        { /* eat whitespace */ }
";".*                           { /* eat up one line comments */ }

%%
