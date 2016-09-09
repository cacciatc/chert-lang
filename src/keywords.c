#include <stdlib.h>

#include "keywords.h"
#include "symtab.h"

void keyword(token_t keyword, token_t arg, token_t* rhand, symtab_t* symbols) {
    switch(keyword.lval) {
        case DEFINE:
            /* define without assignment */
            if(!rhand) {
                symval_t* val = malloc(sizeof(symval_t));

                val->type = UNASSIGNED;

                /* add to symbol table */
                symtab_add(symbols, arg.text, val);
            } 
            /* define with assignment */
            else {
                symval_t* val = malloc(sizeof(symval_t));

                val->type = NUM8;

                /* add to symbol table */
                symtab_add(symbols, arg.text, val);
            }
            break;
    }
}
