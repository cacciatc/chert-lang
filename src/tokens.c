#include <stdlib.h>
#include "tokens.h"

void free_tokens(int c, ...) {
    va_list ap;
    va_start(ap, c); 

    for(int i = 0; i < c; i++) {
        free(va_arg(ap, token_t).text);
    }
    va_end(ap);
}
