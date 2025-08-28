all:
	bison -d parser.y
	flex lexer.l
	gcc parser.tab.c lex.yy.c symtab.c -o p2
	./p2 < input.txt > output.txt

clean:
	rm -f parser.tab.* lex.yy.c p2 output.txt
