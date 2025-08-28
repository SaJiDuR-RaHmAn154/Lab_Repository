all:
	mkdir -p ./out
	bison -d -o ./out/parser.tab.c parser.y
	flex -o ./out/lex.yy.c lexer.l
	gcc -o ./out/compiler ./out/parser.tab.c ./out/lex.yy.c
	./out/compiler < input.txt > output.txt

clean:
	rm -rf ./out/* output.txt