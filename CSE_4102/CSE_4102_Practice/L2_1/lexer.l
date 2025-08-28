%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"

int lineno = 1; 
void yyerror(const char *s);   /* declare yyerror so no implicit warning */
%}

alpha [A-Za-z_]
digit [0-9]
alnum ({alpha}|{digit})
str \"([^\"]*)\"
ID (_|{alpha}){alnum}*

%%

"float"        { printf("%s -> FLOAT\n", yytext); return FLOAT; }
"input"        { printf("%s -> INPUT\n", yytext); return INPUT; }
"if"           { printf("%s -> IF\n", yytext); return IF; }
"elif"         { printf("%s -> ELIF\n", yytext); return ELIF; }
"else"         { printf("%s -> ELSE\n", yytext); return ELSE; }
"print"        { printf("%s -> PRINT\n", yytext); return PRINT; }

{digit}+        { printf("%s -> INT_NUM\n", yytext); yylval.int_val = atoi(yytext); return INT_NUM; }
{str}           { printf("%s -> STRING\n", yytext); strcpy(yylval.str_val, yytext); return STRING; }

">"            { printf("%s -> GT\n", yytext); return GT; }
"=="           { printf("%s -> EQ\n", yytext); return EQ; }
"("            { printf("%s -> LP\n", yytext); return LP; }
"\)"           { printf("%s -> RP\n", yytext); return RP; }
"="            { printf("%s -> ASSIGN\n", yytext); return ASSIGN; }

";"            { printf("%s -> SEMI\n", yytext); return SEMI; }
":"            { printf("%s -> COLON\n", yytext); return COLON; }

{ID}        { printf("%s -> ID\n", yytext); strcpy(yylval.str_val, yytext); return ID; }

[ \t\r\n]+    { if(yytext[0]=='\n') lineno++; }

.       	{ yyerror("Unrecognized character"); }

%%

