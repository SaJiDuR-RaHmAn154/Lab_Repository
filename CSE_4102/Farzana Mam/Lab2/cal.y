/* ============================================================================
 * BISON GRAMMAR FILE FOR SIMPLE CALCULATOR
 * ============================================================================
 * This file defines the grammar rules for parsing mathematical expressions
 * Bison will generate a parser (cal.tab.c) that can parse arithmetic expressions
 * ============================================================================ */

%{
/* C DECLARATIONS SECTION - Code copied to generated parser */
#include<stdio.h>         /* Include standard I/O functions like printf */
void yyerror(char *s);    /* Declare error handling function */
int yylex();              /* Declare lexer function (will be provided by Flex) */
%}

/* ============================================================================
 * BISON DECLARATIONS SECTION
 * ============================================================================ */
%token NUM ADD SUB        /* Declare tokens: NUM (numbers), ADD (+), SUB (-) */
%start cal               /* Specify 'cal' as the start symbol (top-level rule) */

/* ============================================================================
 * GRAMMAR RULES SECTION
 * ============================================================================
 * Format: nonterminal : rule1 { action1 } | rule2 { action2 } ;
 * $$ = result of current rule, $1 = first symbol, $2 = second symbol, etc.
 * ============================================================================ */
%%
/* CALCULATOR: Top-level rule that processes one complete expression */
cal: exp { $$ = $1; printf("=%d\n", $$);}  /* When we parse an expression, print result with '=' */
   ;

/* EXPRESSION: Recursive rules for arithmetic expressions */
exp: exp ADD NUM {$$ = $1 + $3;}  /* Expression + Number: Add the number to expression result */
 | exp SUB NUM {$$ = $1 - $3;}    /* Expression - Number: Subtract number from expression result */
 | NUM {$$ = $1;}                 /* Base case: Single number becomes an expression */
 ;

%%

/* ============================================================================
 * C CODE SECTION - Additional functions
 * ============================================================================ */

/* MAIN FUNCTION: Entry point of the program */
int main(){
    yyparse();                      /* Start parsing input using generated parser */
    printf("Parsing Finished\n");  /* Print completion message */
    return 0;                       /* Return success code */
}

/* ERROR HANDLING FUNCTION: Called when parser encounters syntax errors */
void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);  /* Print error message to standard error */
}