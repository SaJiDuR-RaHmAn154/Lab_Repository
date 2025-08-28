%{
#include<stdio.h>
void yyerror(char *s);
int yylex();

%}
%token NUM ADD SUB IF WHILE ID LP RP LB RB EQUAL ASSIGN SEMI
%start statement

%%
statement: statement IF LP exp RP LB id_declare RB
         | statement WHILE LP exp RP LB id_declare RB
         |
         ;
exp: exp EQUAL NUM
    |ID
    ;
id_declare: id_declare ID ASSIGN NUM SEMI
           | id_declare ID ASSIGN ID ADD NUM SEMI
           | id_declare ID ASSIGN NUM ADD NUM SEMI
           |
           ;

%%


int main(){

    yyparse();
    printf("Parsing Finished\n");
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}