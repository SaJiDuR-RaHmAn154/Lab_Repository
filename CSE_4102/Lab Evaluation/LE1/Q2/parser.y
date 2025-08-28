%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int lineno;
void yyerror(const char *s);
extern int yylex();
%}

%union {
    char *str_val;
}

%token UCODE STRING YEAR ROLLNUM HIPEN HASH

%start program

%%

program: statements
       ;

statements: statements statement
          | statement
          ;

statement: UCODE STRING HIPEN YEAR STRING HASH ROLLNUM
         ;

%%

int main (int argc, char *argv[])
{
    yyparse();
    printf("Parsing finished!\n");	
    return 0;
}
void yyerror(const char *s)
{
    fprintf(stderr, "Parse error: %s at line %d\n", s, lineno);
}
