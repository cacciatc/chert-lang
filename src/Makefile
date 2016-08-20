CFLAGS = -Wall -std=c99
CC     = clang


jasper: main.o parser.o scanner.o compiler.o
	$(CC) -o ../bin/jasper main.o scanner.o compiler.o

main.o: main.c

compiler.o: compiler.h compiler.c parser.h parser.c
	$(CC) -c compiler.c -o compiler.o

parser.h parser.c: parser.y ../bin/lemon
	../bin/lemon parser.y

scanner.o: scanner.c scanner.h

scanner.h scanner.c: lex.l parser.h
	flex --outfile=scanner.c --header-file=scanner.h lex.l

# Prevent yacc from trying to build parsers.
# http://stackoverflow.com/a/5395195/79202
%.c: %.y

bin/lemon: lemon.c
	$(CC) -o bin/lemon lemon.c

.PHONY: clean
clean:
	rm -f *.o
	rm -f scanner.c scanner.h
	rm -f parser.c parser.h parser.out
	rm -f bin/jasper bin/lemon