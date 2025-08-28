%option noyywrap

%{
#include "parser.tab.h"
#include <stdio.h>
#include <string.h>
%}

digit [0-9]
year {digit}{4}
degree [A-Za-z]+
number {digit}+

%%
"Year"          { printf("Token: YEAR\n"); return YEAR; }
"("             { printf("Token: LPAREN\n"); return LPAREN; }
")"             { printf("Token: RPAREN\n"); return RPAREN; }
"-"             { printf("Token: DASH\n"); return DASH; }
{year}          { printf("Token: YEAR_NUM (%s)\n", yytext); 
                  yylval.num = atoi(yytext); return YEAR_NUM; }
{degree}        { printf("Token: DEGREE (%s)\n", yytext); 
                  strcpy(yylval.str, yytext); return DEGREE; }
{number}        { printf("Token: NUMBER (%s)\n", yytext); 
                  yylval.num = atoi(yytext); return NUMBER; }
[ \t]+          { /* ignore whitespace */ }
\n              { printf("Token: NEWLINE\n"); return NEWLINE; }
.               { printf("Unknown character: %s\n", yytext); }

%%
