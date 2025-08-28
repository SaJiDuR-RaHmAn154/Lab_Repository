%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"
int lineno = 1;
void yyerror();
%}

alpha [a-zA-Z]
digit [0-9]
alnum ({alpha}|{digit})
print [ -~]

ID (_|{alpha}){alnum}*
INT_NUM [0-9]+
FLOAT_NUM {digit}+"."{digit}+

%%

"function" { printf("%s -> FUNCTION\n", yytext); return FUNCTION; }
"begin"    { printf("%s -> BEG\n", yytext); return BEG; }
"end"      { printf("%s -> END\n", yytext); return END; }
"return"   { printf("%s -> RET\n", yytext); return RET; }
"int"      { printf("%s -> INT_TYPE\n", yytext); return INT_TYPE; }
"float"    { printf("%s -> FLOAT_NUM\n", yytext); return FLOAT_NUM; }

"%"        { printf("%s -> MOD\n", yytext); return MOD; }
"=="       { printf("%s -> EQUAL\n", yytext); return EQUAL; }
":"        { printf("%s -> COLON\n", yytext); return COLON; }
"("        { printf("%s -> LP\n", yytext); return LP; }
"\)"       { printf("%s -> RP\n", yytext); return RP; }

{FLOAT_NUM} { printf("%s -> FLOAT_NUM\n", yytext); return FLOAT_NUM; }
{INT_NUM}   { printf("%s -> INT_NUM\n", yytext); return INT_NUM; }
{ID}        { printf("%s -> ID\n", yytext); strcpy(yylval.str_val, yytext); return ID; }

";"        { printf("%s -> SEMI\n", yytext); return SEMI; }

"\n"       { lineno++; }
[ \t\r]+   { }

.           { yyerror(); }

%%

void yyerror();
