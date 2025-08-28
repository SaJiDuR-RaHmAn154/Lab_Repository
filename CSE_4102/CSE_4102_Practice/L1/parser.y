%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int lineno;
void yyerror(char *s);
extern int yylex();
%}

%union {
    char *str_val;
}

%token UCODE DEPT SERIES UNI OF CITY ROLL HIPEN SRL COLON EXROLL
%token TO DEPTCODESL DEPTCODE RNL FORMAT LP RP ACCEPTEDL COMMA

%start code

%%

code: statements
    ;

statements: statements statement
          | statement
          ;

statement: UCODE DEPT SERIES
        | UNI OF CITY
        | ROLL HIPEN ROLL
        | SRL COLON SERIES SRL TO SERIES SRL
        | DEPTCODESL COLON DEPTCODE TO DEPTCODE
        | RNL COLON ROLL TO ROLL
        | FORMAT COLON LP SRL RP LP DEPTCODESL RP LP RNL RP
        | ACCEPTEDL COLON Rolls
        ;

Rolls: Rolls COMMA EXROLL
     | EXROLL
     ;

%%

int main (int argc, char *argv[])
{
    yyparse();
    printf("Parsing finished!\n");	
    return 0;
}

void yyerror(char *s)
{
    fprintf(stderr, "Parse error: %s at line %d\n", s, lineno);
}