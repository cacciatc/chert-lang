#pragma once

#include "symtab.h"

typedef struct scope_t {
    struct scope_t** parent;

    symtab_t* symbols;
} scope_t;

void scope_create(scope_t** scope);
void scope_free(scope_t** scope);
