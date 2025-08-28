/* ============================================================================
 * FLEX LEXICAL ANALYZER FOR C-LIKE LANGUAGE WITH SYMBOL TABLE (LAB 4)
 * ============================================================================
 * Advanced lexer supporting:
 * - Multiple data types (int, double, char)
 * - Various constants (integer, float, character)
 * - Comments, operators, and error handling
 * - Line number tracking for debugging
 * ============================================================================ */

%option noyywrap  /* Tell flex we don't need yywrap() function */

%{
	/* HEADER INCLUSIONS AND DECLARATIONS */
	#include <stdio.h>           /* Standard I/O functions */
	#include <stdlib.h>          /* Standard library functions */
	#include <string.h>          /* String manipulation functions */
	#include "parser.tab.h"      /* Include parser-generated header file */
	
	int lineno = 1;              /* Line number counter for error reporting (initialize to 1) */
	void yyerror();              /* Error handling function declaration */
%}

/* ============================================================================
 * REGULAR EXPRESSION DEFINITIONS
 * ============================================================================ */
alpha     [a-zA-Z]              /* Alphabetic characters (uppercase and lowercase) */
digit     [0-9]                 /* Numeric digits 0-9 */
alnum     {alpha}|{digit}       /* Alphanumeric: either letter or digit */
print     [ -~]                 /* Printable ASCII characters (space to tilde) */

ID        {alpha}{alnum}*       /* Identifier: starts with letter, followed by letters/digits */
ICONST    [0-9]{digit}*         /* Integer constant: one or more digits */
FCONST    {digit}*"."{digit}+   /* Float constant: digits.digits format */
CCONST    (\'{print}\')         /* Character constant: 'c' format with printable character */

/* ============================================================================
 * LEXICAL RULES SECTION
 * ============================================================================ */
%%

"//".*        { }               /* COMMENT: Single-line comment (ignore everything after //) */

/* DATA TYPE KEYWORDS */
"int"       { return INT; }      /* Integer type keyword */
"double"    { return DOUBLE; }   /* Double precision floating point type */
"char"		{ return CHAR; }     /* Character type keyword */

/* CONTROL FLOW KEYWORDS */
"if"		{return IF;}         /* Conditional statement keyword */
"else"		{return ELSE;}       /* Alternative branch keyword */

/* ARITHMETIC OPERATORS */
"+"       { return ADDOP; }      /* Addition operator */
"-"       { return SUBOP; }      /* Subtraction operator */
"*"       { return MULOP; }      /* Multiplication operator */
"/"       { return DIVOP; }      /* Division operator */

/* COMPARISON OPERATORS */
"=="      { return EQUOP; }      /* Equality comparison operator */
">"       { return GT; }         /* Greater than operator */
"<"       { return LT; }         /* Less than operator */

/* PUNCTUATION AND DELIMITERS */
"("       { return LPAREN; }     /* Left parenthesis */
")"       { return RPAREN; }     /* Right parenthesis */
"{"       { return LBRACE; }     /* Left brace (block start) */
"}"       { return RBRACE; }     /* Right brace (block end) */
";"       { return SEMI; }       /* Semicolon (statement terminator) */
"="       { return ASSIGN; }     /* Assignment operator */

/* CONSTANTS AND IDENTIFIERS */
{ID}        {strcpy(yylval.str_val, yytext); return ID;}      /* Identifier: copy text to yylval and return ID token */
{ICONST}    {return ICONST;}     /* Integer constant */
{FCONST}    {return FCONST;}     /* Floating point constant */
{CCONST}    {return CCONST;}     /* Character constant */

/* WHITESPACE AND LINE HANDLING */
"\n"        { lineno += 1; }     /* Newline: increment line number counter for error reporting */
[ \t\r\f]+                       /* Whitespace: ignore spaces, tabs, carriage returns, form feeds */

/* ERROR HANDLING */
.       { yyerror("Unrecognized character"); }  /* Any other character: report as error */

%%
