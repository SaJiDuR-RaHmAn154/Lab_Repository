%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "parser.tab.h"

int lineno = 1; 
void yyerror(const char *s);   /* declare yyerror so no implicit warning */
%}

WS          [ \t\n]+
DIGIT       [0-9]
DEPTCODE    00|01|02|03|04|05|06|07|08|09|10
SERIES      [0-9]{2}
ROLLNUM     [0-9]{3}
ExRoll      {SERIES}{DEPTCODE}{ROLLNUM}

%%

"RUET"              { printf("\"%s\" -> UCODE\n", yytext); return UCODE; }
"CUET"              { printf("\"%s\" -> UCODE\n", yytext); return UCODE; }
"BUET"              { printf("\"%s\" -> UCODE\n", yytext); return UCODE; }
"University"        { printf("\"%s\" -> UNI\n", yytext); return UNI; }
"of"                { printf("\"%s\" -> OF\n", yytext); return OF; }
"Dhaka"             { printf("\"%s\" -> CITY\n", yytext); return CITY; }
"Rajshahi"          { printf("\"%s\" -> CITY\n", yytext); return CITY; }
"Chittagong"        { printf("\"%s\" -> CITY\n", yytext); return CITY; }
"CSE"               { printf("\"%s\" -> DEPT\n", yytext); return DEPT; }
"EEE"               { printf("\"%s\" -> DEPT\n", yytext); return DEPT; }
"to"                { printf("\"%s\" -> TO\n", yytext); return TO; }

"Series"            { printf("\"%s\" -> SRL\n", yytext); return SRL; }
"series"            { printf("\"%s\" -> SRL\n", yytext); return SRL; }
"Department_Codes"  { printf("\"%s\" -> DEPTCODESL\n", yytext); return DEPTCODESL; }
"Roll_Numbers"      { printf("\"%s\" -> RNL\n", yytext); return RNL; }
"Format"            { printf("\"%s\" -> FORMAT\n", yytext); return FORMAT; }
"Accepted Inputs"   { printf("\"%s\" -> ACCEPTEDL\n", yytext); return ACCEPTEDL; }

{ExRoll}            { printf("\"%s\" -> EXROLL\n", yytext); return EXROLL; }
{DEPTCODE}           { printf("\"%s\" -> DEPTCODE\n", yytext); return DEPTCODE; }
{SERIES}            { printf("\"%s\" -> SERIES\n", yytext); return SERIES; }
{ROLLNUM}           { printf("\"%s\" -> ROLL\n", yytext); return ROLL; }

":"                 { printf("\"%s\" -> COLON\n", yytext); return COLON; }
","                 { printf("\"%s\" -> COMMA\n", yytext); return COMMA; }
"("                 { printf("\"%s\" -> LP\n", yytext); return LP; }
")"                 { printf("\"%s\" -> RP\n", yytext); return RP; }
"-"                 { printf("\"%s\" -> HIPEN\n", yytext); return HIPEN; }

"\n"                { lineno += 1; }
"//".*              { /* skip comment */ }
{WS}                { /* skip whitespace */ }

%%
