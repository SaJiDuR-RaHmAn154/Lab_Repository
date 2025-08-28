/* ============================================================================
 * BISON GRAMMAR FOR ENHANCED PROGRAMMING LANGUAGE (LAB 3)
 * ============================================================================
 * Enhanced grammar with:
 * - If-else statements
 * - Multiple comparison operators
 * - Type declarations (int)
 * - More flexible expression handling
 * ============================================================================ */

%{
/* C DECLARATIONS SECTION */
#include<stdio.h>         /* Standard I/O functions */
void yyerror(char *s);    /* Error handling function declaration */
int yylex();              /* Lexer function declaration */
%}

/* ============================================================================
 * TOKEN DECLARATIONS
 * ============================================================================ */
%token NUM ADD SUB IF ELSE WHILE ID LP RP LB RB EQUAL ASSIGN SEMI INT GT GE LT LE
/* NUM: numbers, ADD: +, SUB: -, IF: if, ELSE: else, WHILE: while
   ID: identifiers, LP: (, RP: ), LB: {, RB: }, EQUAL: ==, ASSIGN: =, SEMI: ;
   INT: int keyword, GT: >, GE: >=, LT: <, LE: <= */

%start statements         /* Start symbol - allows multiple statements */

/* ============================================================================
 * GRAMMAR RULES SECTION
 * ============================================================================ */
%%
/* STATEMENTS: Collection of multiple statements (program structure) */
statements: statements statement    /* Recursive: add statement to existing statements */
          |                         /* Base case: empty program */
          ;

/* STATEMENT: Individual language constructs */
statement: IF LP exp RP LB id_declare RB ELSE LB id_declare RB    /* Complete if-else: if (exp) { decls } else { decls } */
         | IF LP exp RP LB id_declare RB                          /* Simple if: if (exp) { decls } */
         | WHILE LP exp RP LB id_declare RB                       /* While loop: while (exp) { decls } */
         | id_declare                                             /* Standalone declarations */
         ;

/* EXPRESSION: Mathematical and logical expressions with operator precedence */
exp: exp EQUAL exp        /* Equality comparison: exp == exp */
    | exp GT exp          /* Greater than: exp > exp */
    | exp GE exp          /* Greater than or equal: exp >= exp */
    | exp LT exp          /* Less than: exp < exp */
    | exp LE exp          /* Less than or equal: exp <= exp */
    | exp ADD exp         /* Addition: exp + exp */
    | exp SUB exp         /* Subtraction: exp - exp */
    | ID                  /* Base case: identifier */
    | NUM                 /* Base case: number literal */
    ;

/* IDENTIFIER DECLARATIONS: Variable declarations and assignments */
id_declare: id_declare ID ASSIGN exp SEMI          /* Assignment: variable = expression; */
          | id_declare INT ID ASSIGN exp SEMI      /* Declaration with initialization: int variable = expression; */
          |                                        /* Empty: allow blocks without declarations */
          ;
%%

/* ============================================================================
 * C CODE SECTION
 * ============================================================================ */

/* MAIN FUNCTION: Program entry point */
int main(){
    yyparse();                      /* Start parsing input */
    printf("Parsing Finished\n");  /* Print completion message */
    return 0;                       /* Return success */
}

/* ERROR HANDLING: Called when syntax errors occur */
void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);  /* Print error message to stderr */
}