#pragma once

typedef struct {
    int16_t  code;
    uint16_t lval;
    const char* text;
} token_t;


/* the next token to parse */
token_t next_token;

/* entry point for compilation */
void compile(const char* fname);

/* handle instructions */
void instruction(token_t instr, token_t* args, uint8_t argc);
 
void macro(token_t token, token_t* args);
