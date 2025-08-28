%{
#include<stdio.h>
void yyerror(char *s);
int yylex();

%}
%token NUM ADD SUB IF ELSE WHILE ID LP RP LB RB EQUAL ASSIGN SEMI INT GT GE LT LE
%start statements

%%
statements: statements statement  
          | 
          ;

statement: IF LP exp RP LB id_declare RB ELSE LB id_declare RB
         | IF LP exp RP LB id_declare RB
         | WHILE LP exp RP LB id_declare RB
         | id_declare
         ;

id_declare: id_declare ID ASSIGN exp SEMI
          | id_declare INT ID ASSIGN exp SEMI
          | 
          ;         

exp: exp EQUAL exp
    | exp GT exp
    | exp GE exp
    | exp LT exp
    | exp LE exp
    | exp ADD exp
    | exp SUB exp
    | ID
    | NUM
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