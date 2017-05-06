build: bin bin/lemon
	@$(MAKE) -C src --no-print-directory

bin/lemon:
	clang src/lemon.c -o bin/lemon

test:
	@$(MAKE) -C test --no-print-directory

bin:
	mkdir bin

