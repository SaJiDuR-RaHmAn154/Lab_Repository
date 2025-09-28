/* ============================================================================
 * BISON PARSER FOR C-LIKE LANGUAGE WITH SYMBOL TABLE (LAB 5)
 * ============================================================================
 * Enhanced parser with:
 * - Symbol table integration for variable tracking
 * - Type checking for expressions and assignments
 * - Multiple data types (int, double, char)
 * - Input/output function support (scan, print)
 * - Complex if-else structures
 * ============================================================================ */

%{
	/* C DECLARATIONS SECTION */
	#include <stdio.h>           /* Standard I/O functions */
	#include <stdlib.h>          /* Standard library functions */
	#include <string.h>          /* String manipulation functions */
    #include "symtab.c"          /* Include symbol table implementation */
	void yyerror(const char *s); /* Error handling function declaration */
	extern int lineno;           /* Line number from lexer (for error reporting) */
	extern int yylex();          /* Lexer function declaration */
%}

/* ============================================================================
 * UNION DECLARATION - Defines data types for semantic values
 * ============================================================================ */
%union{
    char str_val[100];           /* String value for identifiers and constants */
    int int_val;                 /* Integer value for type information */
}

/* ============================================================================
 * TOKEN DECLARATIONS
 * ============================================================================ */
%token INT IF ELSE WHILE CONTINUE BREAK DOUBLE CHAR         /* Keywords */
%token SCAN PRINT                                           /* I/O function keywords */
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT                  /* Operators */
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN             /* Punctuation */
%token<str_val> ID                                          /* Identifiers (have string value) */
%token<str_val> ICONST                                      /* Integer constants */
%token<str_val> FCONST                                      /* Float constants */
%token<str_val> CCONST                                      /* Character constants */

/* ============================================================================
 * TYPE DECLARATIONS - Specify what type of value non-terminals return
 * ============================================================================ */
%type<int_val> type constant exp                            /* These return integer type codes */

/* ============================================================================
 * OPERATOR PRECEDENCE AND ASSOCIATIVITY
 * ============================================================================ */
%left LT GT      /* LT GT has lowest precedence, left associative */
%left ADDOP      /* ADDOP has medium precedence, left associative */
%left MULOP      /* MULOP has highest precedence, left associative */

%start code      /* Start symbol of the grammar */

/* ============================================================================
 * GRAMMAR RULES SECTION
 * ============================================================================ */
%%
/* TOP-LEVEL PROGRAM STRUCTURE */
code: statements;                                            /* Program consists of statements */

/* STATEMENT COLLECTION */
statements: statements statement                             /* Multiple statements (recursive) */
          |                                                 /* Empty (base case) */
          ;

/* INDIVIDUAL STATEMENTS */
statement:  declaration                                      /* Variable declaration */
           | if_statement                                    /* Conditional statement */
           | assignment_statement                            /* Assignment statement */
           | io_statement                                    /* Input/output statement */
            ;

/* ASSIGNMENT STATEMENTS */
assignment_statement: ID ASSIGN exp SEMI                    /* Assignment statement */
           {
            /* SEMANTIC ACTION: Check if variable exists and types match */
            if(idcheck($1)==0)                              /* Check if identifier is declared */
              yyerror("Undeclared variable");               /* Error if undeclared variable */
            
            if(typecheck(gettype($1),$3)==0)                /* Check type compatibility */
               yyerror("Type mismatch in assignment");      /* Error if type mismatch */
            else
               printf("In line no %d, Assignment: %s = expression of type %s\n", lineno, $1, typename[gettype($1)]);
           }
            ;

/* INPUT/OUTPUT STATEMENTS */
io_statement: SCAN LPAREN ID RPAREN SEMI                   /* Input statement: scan(variable); */
             {
                if(idcheck($3)==0)                          /* Check if variable is declared */
                  yyerror("Undeclared variable in scan");   /* Error if undeclared variable */
                printf("Reading input into variable %s\n", $3);
             }
            | PRINT LPAREN ID RPAREN SEMI                   /* Output statement: print(variable); */
             {
                if(idcheck($3)==0)                          /* Check if variable is declared */
                  yyerror("Undeclared variable in print");  /* Error if undeclared variable */
                printf("Printing value of variable %s\n", $3);
             }
            | PRINT LPAREN exp RPAREN SEMI                  /* Output statement: print(expression); */
             {
                printf("Printing expression result\n");
             }
            ;

/* VARIABLE DECLARATIONS */
declaration: type ID SEMI                                   /* Simple declaration: int x; */
             {
                insert($2, $1);                            /* Insert variable into symbol table */
             }

            |type ID ASSIGN exp SEMI                        /* Declaration with initialization: int x = 5; */
             {
                insert($2, $1);                            /* Insert variable into symbol table */
                if(typecheck($1,$4)==0)                     /* Check type compatibility for initialization */
                   yyerror("Type mismatch in initialization"); /* Error if type mismatch */
             }
            ;

/* DATA TYPES */
type: INT {$$ = INT_TYPE;}                                  /* Integer type returns INT_TYPE constant */
    | DOUBLE {$$ = REAL_TYPE;}                              /* Double type returns REAL_TYPE constant */
    | CHAR  {$$ = CHAR_TYPE;}                               /* Character type returns CHAR_TYPE constant */
    ;

/* EXPRESSIONS */
exp: constant {$$ = $1;}                                    /* Constant expression */
    | ID                                                    /* Variable reference */
    { 
      if(idcheck($1)==0)                                    /* Check if variable is declared */
            yyerror("Undeclared variable");                 /* Error if undeclared */
      else {    
         $$ = gettype($1);                                  /* Get variable's type from symbol table */
         printf("In line no %d, Variable reference: %s (type %s)\n", lineno, $1, typename[$$]);
      }
    }
    | exp ADDOP exp                                         /* Addition/Subtraction expression */
    {
        if(typecheck($1, $3)==0)                           /* Check if operand types are compatible */
           yyerror("Type mismatch in addition/subtraction"); /* Error if incompatible types */
        else {
          $$ = typecheck($1, $3);                           /* Return result type */
          printf("In line no %d, Arithmetic operation: %s + %s = %s\n", 
                 lineno, typename[$1], typename[$3], typename[$$]);
        }
    }
    | exp SUBOP exp                                         /* Subtraction expression */
    {
        if(typecheck($1, $3)==0)                           /* Check if operand types are compatible */
           yyerror("Type mismatch in subtraction"); /* Error if incompatible types */
        else {
          $$ = typecheck($1, $3);                           /* Return result type */
          printf("In line no %d, Arithmetic operation: %s - %s = %s\n", 
                 lineno, typename[$1], typename[$3], typename[$$]);
        }
    }
    | exp MULOP exp                                         /* Multiplication/Division expression */
    {
        if(typecheck($1, $3)==0)                           /* Check if operand types are compatible */
           yyerror("Type mismatch in multiplication/division"); /* Error if incompatible types */
        else
          $$ = typecheck($1, $3);                           /* Return result type */
    }
    |exp GT exp                                             /* Greater than comparison */
    {
        if(typecheck($1, $3)==0)                           /* Check if operand types are compatible */
           yyerror("Type mismatch in comparison");          /* Error if incompatible types */
        else
          $$ = INT_TYPE;                                    /* Comparison results in boolean (represented as int) */
    }
    |exp LT exp                                             /* Less than comparison */
    {
        if(typecheck($1, $3)==0)                           /* Check if operand types are compatible */
           yyerror("Type mismatch in comparison");          /* Error if incompatible types */
        else
          $$ = INT_TYPE;                                    /* Comparison results in boolean (represented as int) */
    }
    ;

/* CONSTANTS */
constant: ICONST {$$ = INT_TYPE; printf("In line no %d, Integer constant: %s\n", lineno, $1);}    /* Integer constant has INT_TYPE */
        | FCONST  {$$ = REAL_TYPE; printf("In line no %d, Float constant: %s\n", lineno, $1);}    /* Float constant has REAL_TYPE */
        | CCONST  {$$ = CHAR_TYPE; printf("In line no %d, Character constant: %s\n", lineno, $1);} /* Character constant has CHAR_TYPE */
        ;

/* CONDITIONAL STATEMENTS */
if_statement: IF LPAREN exp RPAREN LBRACE statements RBRACE optional_else   /* If statement with optional else */
        ;

/* OPTIONAL ELSE CLAUSES */
optional_else: ELSE IF LPAREN exp RPAREN LBRACE statements RBRACE          /* Else-if clause */
              | ELSE LBRACE statements RBRACE                              /* Simple else clause */
              |                                                            /* No else clause */
              ;

%%

/* ============================================================================
 * C CODE SECTION - Support functions
 * ============================================================================ */

/* ERROR HANDLING FUNCTION: Called when syntax errors occur */
void yyerror (const char *s)
{
	printf("Syntax error at line %d: %s\n", lineno, s);     /* Print error with line number */
	exit(1);                                                /* Exit program with error code */
}

/* MAIN FUNCTION: Program entry point */
int main (int argc, char *argv[])
{
	printf("=== Lab 5 Lexical, Syntax, and Semantic Analyzer ===\n");
	printf("Processing input...\n\n");
	yyparse();                                              /* Start parsing input */
	print_symbol_table();                                   /* Display symbol table */
	printf("\n=== Analysis Summary ===\n");
	printf("✓ Lexical analysis completed\n");
	printf("✓ Syntax analysis completed\n");
	printf("✓ Semantic analysis completed\n");
	printf("✓ Symbol table operations completed\n");
	printf("Parsing finished successfully!\n");
	return 0;                                               /* Return success code */
}