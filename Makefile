build: bin
	@$(MAKE) -C src --no-print-directory

test:
	@$(MAKE) -C test --no-print-directory

bin:
	mkdir bin

