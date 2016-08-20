#pragma once

typedef struct {
    int code;
    int lval;
    const char* text;
} token_t;

/* the current token */
token_t token;

void compile(const char* fname);
