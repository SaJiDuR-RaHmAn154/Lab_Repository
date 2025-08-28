%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"
int lineno = 1;
void yyerror();
%}

alpha [A-Za-z]
digit [0-9]
alnum [A-Za-z0-9]

ID [_A-Za-z][A-Za-z0-9]*
INT_NUM [0-9]+
FLOAT_NUM [0-9]+"."[0-9]+

%%

"dim"    { printf("%s -> DIM\n", yytext); return DIM; }
"as"     { printf("%s -> AS\n", yytext); return AS; }
"integer" { printf("%s -> INTEGER\n", yytext); return INTEGER; }
"For"     { printf("%s -> FOR\n", yytext); return FOR; }
"To"      { printf("%s -> TO\n", yytext); return TO; }
"Next"    { printf("%s -> NEXT\n", yytext); return NEXT; }

{ID}      { printf("%s -> ID\n", yytext); strcpy(yylval.str_val, yytext); return ID; }
{INT_NUM} { printf("%s -> INT_NUM\n", yytext); yylval.int_val = atoi(yytext); return INT_NUM; }
{FLOAT_NUM} { printf("%s -> FLOAT_NUM\n", yytext); return FLOAT_NUM; }

"="      { printf("%s -> ASSIGN\n", yytext); return ASSIGN; }

[ \t\r\n]+ { if(yytext[0]=='\n') lineno++; }

.         { printf("%s -> UNKNOWN\n", yytext); }

%%

void yyerror();
