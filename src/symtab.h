#pragma once

typedef enum val_t { 
    UNASSIGNED, NUM8, NUM16
} val_t;

typedef union symval_t {
    uint8_t  num8;
    uint16_t num16;
    val_t    type;
} symval_t;

typedef struct symtab_entry_t {
    const char* key;
    struct symtab_entry_t* next;
} symtab_entry_t;

typedef symtab_entry_t symtab_t;

/* Adds a symbol to the table. */
void symtab_add(symtab_t* table, const char* key, symval_t* val);
