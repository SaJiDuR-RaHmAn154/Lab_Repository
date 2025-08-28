%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"

int lineno = 1; 
void yyerror(const char *s);
%}

ws          [ \t\n]+
digit       [0-9]
year        {digit}{4}
roll        {digit}{3}

%%

"RUET"              { printf("\"%s\" -> UCODE\n", yytext); return UCODE; }
"Session"           { printf("\"%s\" -> STRING\n", yytext); return STRING; }
"Roll"              { printf("\"%s\" -> STRING\n", yytext); return STRING; }

{year}              { printf("\"%s\" -> YEAR\n", yytext); return YEAR; }
{roll}              { printf("\"%s\" -> ROLLNUM\n", yytext); return ROLLNUM; }

"-"                 { printf("\"%s\" -> HIPEN\n", yytext); return HIPEN; }
"#"                 { printf("\"%s\" -> HASH\n", yytext); return HASH; }

"\n"                { lineno += 1; }
{ws}                { }

%%
