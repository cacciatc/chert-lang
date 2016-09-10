#include <stdlib.h>

#include "keywords.h"
#include "symtab.h"

void keyword(token_t keyword, token_t arg, token_t* rhand, scope_t* scope) {
    switch(keyword.lval) {
        case DEFINE:
            /* define without assignment */
            if(!rhand) {
                /* add to symbol table */
                symtab_add(scope->symbols, arg.text, UNASSIGNED, NULL);
            } 
            /* define with assignment */
            else {
                symval_t* val = malloc(sizeof(symval_t));

                val->num8 = rhand->lval;

                /* add to symbol table */
                symtab_add(scope->symbols, arg.text, NUM8, val);
            }
            break;
    }
}
