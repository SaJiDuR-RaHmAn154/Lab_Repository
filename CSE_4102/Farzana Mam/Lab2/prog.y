/* ============================================================================
 * BISON GRAMMAR FOR SIMPLE PROGRAMMING LANGUAGE
 * ============================================================================
 * This grammar defines syntax for a simple language with:
 * - Control structures (if, while)
 * - Variable declarations and assignments
 * - Basic arithmetic expressions
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
%token NUM ADD SUB IF WHILE ID LP RP LB RB EQUAL ASSIGN SEMI
/* NUM: numbers, ADD: +, SUB: -, IF: if keyword, WHILE: while keyword
   ID: identifiers, LP: (, RP: ), LB: {, RB: }, EQUAL: ==, ASSIGN: =, SEMI: ; */

%start statement          /* Start symbol of the grammar */

/* ============================================================================
 * GRAMMAR RULES SECTION
 * ============================================================================ */
%%
/* STATEMENT: Top-level construct - can be control structures or empty */
statement: statement IF LP exp RP LB id_declare RB      /* IF statement: if (expression) { declarations } */
          | statement WHILE LP exp RP LB id_declare RB  /* WHILE statement: while (expression) { declarations } */
          |                                             /* EMPTY: Allow empty program */
         ;

/* EXPRESSION: Simple expressions for conditions */
exp: exp EQUAL NUM        /* Expression equality comparison: expression == number */
    |ID                   /* Base case: identifier alone is an expression */
    ;

/* IDENTIFIER DECLARATIONS: Variable assignments inside blocks */
id_declare: id_declare ID ASSIGN NUM SEMI                  /* Variable = Number; */
           | id_declare ID ASSIGN ID ADD NUM SEMI          /* Variable = Variable + Number; */
           | id_declare ID ASSIGN NUM ADD NUM SEMI         /* Variable = Number + Number; */
           |                                               /* EMPTY: Allow empty declaration block */
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
    fprintf(stderr, "error: %s\n", s);  /* Print error to stderr */
}