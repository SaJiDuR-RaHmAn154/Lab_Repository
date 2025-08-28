# Target: main - Build calculator parser/lexer from cal.l and cal.y
main: cal.l cal.y
	bison cal.y           # Generate parser C code (cal.tab.c) from Yacc grammar file (cal.y)
	flex cal.l            # Generate lexer C code (lex.yy.c) from Flex lexical analyzer file (cal.l)
	gcc cal.tab.c lex.yy.c # Compile parser and lexer C files into executable (a.out)
	a <input.txt> output.txt # Run the executable with input.txt as input, redirect output to output.txt

# Target: main2 - Build program parser/lexer from prog.l and prog.y
main2: prog.l prog.y
	bison -d prog.y       # Generate parser C code (prog.tab.c) and header (prog.tab.h) from Yacc grammar file
	flex prog.l           # Generate lexer C code (lex.yy.c) from Flex lexical analyzer file (prog.l)
	gcc prog.tab.c lex.yy.c # Compile parser and lexer C files into executable (a.out)
	a <input.txt> output.txt # Run the executable with input.txt as input, redirect output to output.txt

# Target: clean - Remove all generated files
clean:
	rm -f *.tab.c *.tab.h  # Remove all Bison-generated parser files (.tab.c and .tab.h)
	rm -f lex.yy.c         # Remove Flex-generated lexer file
	rm -f a.out            # Remove compiled executable
	rm -f output.txt       # Remove output file
