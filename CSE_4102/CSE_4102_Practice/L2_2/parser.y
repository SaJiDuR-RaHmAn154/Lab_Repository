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

%token DIM ID AS INTEGER FOR TO NEXT SEMI FLOAT_NUM INT_NUM ASSIGN
%type<str_val> ID
%type<int_val> FLOAT_NUM INT_NUM
%type<type_val> type

%start prog

%%
prog: stmts ;

stmts: stmts stmt | ;

number: INT_NUM | FLOAT_NUM ;

stmt: DIM ID AS type                                    { insert($2, $4); }
    | FOR ID ASSIGN number TO number stmts NEXT ID     { idcheck($2); idcheck($9); }
    | NEXT ID                                           { idcheck($2); }
    ;

type: INTEGER { $$ = TYPE_INT; }
    ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Parse error: %s at line %d\n", s, lineno);
}

int main() 
{ 
    yyparse();
    printf("Parsing finished!\n"); 
    return 0; 
}
