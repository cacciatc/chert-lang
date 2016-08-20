#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>

#include "compiler.h"

int main(int argc, char** argv) {
    /* compile files */
    while (optind < argc) {
        compile(argv[optind++]);
    }
    return EXIT_SUCCESS;
}
