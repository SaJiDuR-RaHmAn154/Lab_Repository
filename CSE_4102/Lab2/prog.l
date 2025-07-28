%option noyywrap

%{
#include "prog.tab.h"
%}
delim [ \t\n]
ws {delim}+
digit [0-9]
number {digit}+
us [_]
letter [A-Za-z]
id ({letter}|{us})({letter}|{us}|{digit})*


%%
{ws} {}
{number} {yylval = atoi(yytext); return NUM;}
"if" {return IF;}
"while" {return WHILE;}
{id} {return ID;}
"+" {return ADD;}
"-" {return SUB;}
"(" {return LP;}
")" {return RP;}
"{" {return LB;}
"}" {return RB;}
"==" {return EQUAL;}
"=" {return ASSIGN;}
";" {return SEMI;}
%%