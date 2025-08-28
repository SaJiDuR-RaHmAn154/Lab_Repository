main: lexer.l parser.y
	bison -d parser.y
	flex lexer.l
	gcc lex.yy.c parser.tab.c -o parser
	./parser < input.txt > output.txt
