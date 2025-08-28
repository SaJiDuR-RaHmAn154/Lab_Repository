# ============================================================================
# Lab 4 Makefile - C-like Language Parser with Symbol Table
# ============================================================================
# Builds a compiler for a C-like language with:
# - Symbol table for variable tracking
# - Type checking for expressions
# - Support for int, double, char data types
# - If-else statements and complex expressions
# ============================================================================

# Variables for input/output files
input = input.txt         # Input file containing source code to parse
output = output.txt       # Output file for parser results

# Target: main - Build C-like language compiler with symbol table
main: lexer.l parser.y
	bison -d parser.y         # Generate parser C code (parser.tab.c) and header (parser.tab.h) from grammar
	flex lexer.l              # Generate lexer C code (lex.yy.c) from lexical analyzer specification
	gcc parser.tab.c lex.yy.c # Compile parser and lexer (symtab.c included via #include)
	a <$(input)> $(output)    # Run the compiler with input file, redirect output to output file

# Target: clean - Remove all generated files
clean:
	rm -f *.tab.c *.tab.h     # Remove Bison-generated parser files
	rm -f lex.yy.c            # Remove Flex-generated lexer file
	rm -f a.out               # Remove compiled executable
	rm -f $(output)           # Remove output file

# Declare phony targets
.PHONY: main clean