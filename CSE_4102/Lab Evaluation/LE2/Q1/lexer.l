%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
	
	int lineno = 1;
	void yyerror();
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     ({alpha}|{digit})
print     [ -~]

ID        (_|{alpha})(_|{alnum})*
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+

%%

"//".*        { } 

"function"  { printf("\"%s\" -> FUNCTION\n", yytext); return FUNCTION; }
"int"       { printf("\"%s\" -> INT\n", yytext); return INT; }
"double"    { printf("\"%s\" -> DOUBLE\n", yytext); return DOUBLE; }
"char"		{ printf("\"%s\" -> CHAR\n", yytext); return CHAR; }
"as"        { printf("\"%s\" -> AS\n", yytext); return AS; }
"return"    { printf("\"%s\" -> RETURN\n", yytext); return RETURN; }

"+"       { printf("\"%s\" -> ADDOP\n", yytext); return ADDOP; }

"("       { printf("\"%s\" -> LPAREN\n", yytext); return LPAREN; }
")"       { printf("\"%s\" -> RPAREN\n", yytext); return RPAREN; }
"{"       { printf("\"%s\" -> LBRACE\n", yytext); return LBRACE; }
"}"       { printf("\"%s\" -> RBRACE\n", yytext); return RBRACE; }
";"       { printf("\"%s\" -> SEMI\n", yytext); return SEMI; }
","       { printf("\"%s\" -> COMMA\n", yytext); return COMMA; }

{ID}        { printf("\"%s\" -> ID\n", yytext); strcpy(yylval.str_val, yytext); return ID;}
{ICONST}    { printf("\"%s\" -> ICONST\n", yytext); yylval.int_val = atoi(yytext); return ICONST;}
{FCONST}    { printf("\"%s\" -> FCONST\n", yytext); strcpy(yylval.str_val, yytext); return FCONST;}

[ \t\f]		{  }
"\n"        { lineno += 1; }

%%
