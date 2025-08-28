%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "symtab.h"

extern int lineno;
void yyerror(const char *s);
extern int yylex();
%}
%union{
    char str_val[100];
    int int_val;
    int type_val;
}

%token FLOAT INPUT LP STRING RP IF COLON PRINT ELIF ELSE GT EQ INT_NUM ID ASSIGN SEMI
%type<str_val> STRING ID
%type<int_val> INT_NUM
%type<type_val> type

%start program

%%
program: statements ;

statements: statements statement | ;

statement: type ID ASSIGN INPUT LP STRING RP  { insert($2, $1); }
         | IF ID GT INT_NUM COLON              { idcheck($2); }
         | PRINT LP STRING RP
         | ELIF ID EQ INT_NUM COLON            { idcheck($2); }
         | ELSE COLON
         ;

type: FLOAT { $$ = TYPE_REAL; }
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Parse error: %s at line %d\n", s, lineno);
}

int main(int argc, char *argv[]) 
{
    yyparse();
    printf("Parsing finished!\n");	
    return 0;
}
