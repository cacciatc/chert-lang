#pragma once

#include <stdint.h>
#include "parser.h"
#include "compiler.h"
#include "symtab.h"

typedef enum keywords_t {
    DEFINE
} keywords_t;

/* Parses a keyword. */
void keyword(token_t keyword, token_t arg, token_t* rhand, symtab_t* symbols);
