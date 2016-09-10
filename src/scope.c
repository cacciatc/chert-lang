
#include <stdlib.h>
#include "scope.h"
#include "symtab.h"

void scope_create(scope_t** scope) {
    *scope = malloc(sizeof(scope_t));

    symtab_create(&((*scope)->symbols));
}

void scope_free(scope_t** scope) {
    symtab_free(&((*scope)->symbols));
    if(*scope) {
        free(*scope);
    }
}
