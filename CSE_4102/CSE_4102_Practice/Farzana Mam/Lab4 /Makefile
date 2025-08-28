main: lexer.l parser.y
	bison -d parser.y 
	flex lexer.l 
	gcc parser.tab.c lex.yy.c -o parser
	./parser <input.txt> output.txt



