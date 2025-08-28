main: main.o
	gcc main.o -o main

main.o: main.c
	gcc -c main.c -o main.o

parser: lex.l parser.y
	bison -d parser.y
	flex lex.l
	gcc parser.tab.c lex.yy.c -o parser

test: parser
	./parser < test_input.txt

clean:
	rm -f *.o *.tab.c *.tab.h lex.yy.c main parser
