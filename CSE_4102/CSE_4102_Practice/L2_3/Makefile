all:
	bison -d parser.y
	flex lexer.l
	gcc parser.tab.c lex.yy.c symtab.c -o p1
	./p1 < input.txt > output.txt

clean:
	rm -f parser.tab.* lex.yy.c p1 output.txtson -d parser.y
	flex lexer.l
	gcc parser.tab.c lex.yy.c -o p1
	./p1 < input.txt > output.txt

clean:
	rm -f parser.tab.* lex.yy.c parser.output p1 output.txt
