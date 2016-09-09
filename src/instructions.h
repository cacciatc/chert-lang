#pragma once

#include "compiler.h"

typedef enum ops_t { 
    LDA, LDX, LDY, 
    STA, STX, STY } ops_t;

typedef struct {
    ops_t       code;
    const char* name;
    uint8_t     mode_flags;
} opcode_t;

typedef enum modes_t { DIRECT, IMMEDIATE, ZERO_PAGE } modes_t;

/* Parses an instruction with immediate operands. */
void instr_immediate(token_t token, token_t arg);
