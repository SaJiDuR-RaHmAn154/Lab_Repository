/* ============================================================================
 * BISON PARSER FOR C-LIKE LANGUAGE WITH SYMBOL TABLE (LAB 4)
 * ============================================================================
 * Advanced parser with:
 * - Symbol table integration for variable tracking
 * - Type checking for expressions and assignments
 * - Multiple data types (int, double, char)
 * - Complex if-else structures
 * ============================================================================ */

%{
	/* C DECLARATIONS SECTION */
	#include <stdio.h>           /* Standard I/O functions */
	#include <stdlib.h>          /* Standard library functions */
	#include <string.h>          /* String manipulation functions */
    #include "symtab.c"          /* Include symbol table implementation */
	void yyerror();              /* Error handling function declaration */
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
%token INT IF ELSE WHILE CONTINUE BREAK PRINT DOUBLE CHAR    /* Keywords */
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT                   /* Operators */
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN              /* Punctuation */
%token<str_val> ID                                           /* Identifiers (have string value) */
%token<str_val> ICONST                                       /* Integer constants */
%token<str_val> FCONST                                       /* Float constants */
%token<str_val> CCONST                                       /* Character constants */

/* ============================================================================
 * TYPE DECLARATIONS - Specify what type of value non-terminals return
 * ============================================================================ */
%type<int_val> type constant exp                             /* These return integer type codes */

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
           | ID ASSIGN exp SEMI                             /* Assignment statement */
           {
            /* SEMANTIC ACTION: Check if variable exists and types match */
            if(idcheck($1)==0)                              /* Check if identifier is declared */
              yyerror();                                    /* Error if undeclared variable */
            
            if(typecheck(gettype($1),$3)==0)                /* Check type compatibility */
               yyerror();                                   /* Error if type mismatch */
           }
            ;

/* VARIABLE DECLARATIONS */
declaration: type ID SEMI                                   /* Simple declaration: int x; */
             {
                insert($2, $1);                            /* Insert variable into symbol table */
             }

            |type ID ASSIGN exp SEMI                        /* Declaration with initialization: int x = 5; */
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
            yyerror();                                      /* Error if undeclared */
      else     
         $$ = gettype($1);                                  /* Get variable's type from symbol table */
    }
    | exp ADDOP exp                                         /* Addition/Subtraction expression */
    {
        if(typecheck($1, $3)==0)                           /* Check if operand types are compatible */
           yyerror();                                       /* Error if incompatible types */
        else
          $$ = typecheck($1, $3);                           /* Return result type */
    }
    | exp MULOP exp                                         /* Multiplication/Division expression */
    |exp GT exp                                             /* Greater than comparison */
    |exp LT exp                                             /* Less than comparison */
    ;

/* CONSTANTS */
constant: ICONST {$$ = INT_TYPE;}                           /* Integer constant has INT_TYPE */
        | FCONST  {$$ = REAL_TYPE;}                         /* Float constant has REAL_TYPE */
        | CCONST  {$$ = CHAR_TYPE;}                         /* Character constant has CHAR_TYPE */
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
void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);            /* Print error with line number */
	exit(1);                                                /* Exit program with error code */
}

/* MAIN FUNCTION: Program entry point */
int main (int argc, char *argv[])
{
	yyparse();                                              /* Start parsing input */
	printf("Parsing finished!\n");                         /* Print success message */
	return 0;                                               /* Return success code */
}
