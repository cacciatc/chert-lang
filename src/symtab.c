#include <stdlib.h>

#include "symtab.h"

void symtab_add(symtab_t* table, const char* key, val_t type, symval_t* val) {
    if(val) {
        printf("Adding %s with val %d\n", key, val->num8);  
    }
    free(val);
}

void symtab_lookup(symtab_t* table, const char* key, symtab_entry_t entry) {

}

void symtab_create(symtab_t** table) {
    *table = malloc(sizeof(symtab_t));
    
    (*table)->next = NULL;
}

void symtab_free(symtab_t** table) {
    symtab_entry_t* entry;

    entry = (*table)->next;
    while(entry != NULL) {
        symtab_entry_t* next = entry->next;
        if(entry != NULL) {
            free(entry);
        }
        entry = next;
    }

    if(table != NULL) {
        free(*table);
    }
}
