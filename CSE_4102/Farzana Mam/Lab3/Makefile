# ============================================================================
# Lab 3 Makefile - Enhanced Programming Language Parser
# ============================================================================
# Builds a parser for a programming language with if-else, while loops,
# type declarations, and comparison operators
# ============================================================================

# Target: main - Build enhanced programming language parser
main: prog.l prog.y
	bison -d prog.y          # Generate parser C code (prog.tab.c) and header (prog.tab.h) from grammar
	flex prog.l              # Generate lexer C code (lex.yy.c) from lexical analyzer specification
	gcc prog.tab.c lex.yy.c  # Compile parser and lexer into executable (a.out)
	a <input.txt> output.txt # Run the executable with input.txt, redirect output to output.txt

# Target: clean - Remove all generated files
clean:
	rm -f *.tab.c *.tab.h    # Remove Bison-generated parser files
	rm -f lex.yy.c           # Remove Flex-generated lexer file
	rm -f a.out              # Remove compiled executable
	rm -f output.txt         # Remove output file

# Declare phony targets
.PHONY: main clean