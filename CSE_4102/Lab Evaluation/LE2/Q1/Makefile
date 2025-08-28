all:
	bison -d parser.y
	flex lexer.l
	gcc parser.tab.c lex.yy.c symtab.c -o parser
	./parser < input.txt > output.txt
