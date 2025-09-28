# ============================================================================
# Lab 5 Makefile - C-like Language Parser with Symbol Table and I/O Support
# ============================================================================
# Builds a compiler for a C-like language with:
# - Symbol table for variable tracking
# - Type checking for expressions
# - Support for int, double, char data types
# - Input/output operations (scan, print)
# - If-else statements and complex expressions
# ============================================================================

# Variables for input/output files
input = input.txt         # Input file containing source code to parse
output = output.txt       # Output file for parser results

# Target: main - Build C-like language compiler with symbol table
main: lexer.l parser.y
	bison -d parser.y         # Generate parser C code (parser.tab.c) and header (parser.tab.h) from grammar
	flex lexer.l              # Generate lexer C code (lex.yy.c) from lexical analyzer specification
	gcc parser.tab.c lex.yy.c -o analyzer  # Compile parser and lexer (symtab.c included via #include)
	./analyzer < $(input) > $(output)       # Run the compiler with input file, redirect output to output file

# Target: run - Just run the analyzer with input
run: analyzer
	./analyzer < $(input) > $(output)       # Run the analyzer with input file

# Target: clean - Remove all generated files
clean:
	rm -f *.tab.c *.tab.h     # Remove Bison-generated parser files
	rm -f lex.yy.c            # Remove Flex-generated lexer file
	rm -f analyzer            # Remove compiled executable
	rm -f $(output)           # Remove output file

# Declare phony targets
.PHONY: main run clean