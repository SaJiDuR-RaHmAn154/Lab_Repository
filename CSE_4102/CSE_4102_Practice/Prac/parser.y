%{
#include <stdio.h>
#include <string.h>
void yyerror(char *s);
int yylex();
%}

%union {
    int num;
    char str[100];
}

%token <num> YEAR_NUM NUMBER
%token <str> DEGREE
%token YEAR LPAREN RPAREN DASH NEWLINE

%type <num> year_value degree_number
%type <str> degree_name

%start statements

%%


statements: statements statement
              | statement
              ;

statement: YEAR LPAREN year_value RPAREN degree_name DASH degree_number NEWLINE
         { 
           printf("Parsed: Year (%d) %s-%d\n", $3, $5, $7);
         }
         | YEAR LPAREN year_value RPAREN degree_name DASH degree_number
         { 
           printf("Parsed: Year (%d) %s-%d\n", $3, $5, $7);
         }
         ;

year_value: YEAR_NUM
          { 
            $$ = $1;
            printf("Year value: %d\n", $$);
          }
          ;

degree_name: DEGREE
           { 
             strcpy($$, $1);
             printf("Degree: %s\n", $$);
           }
           ;

degree_number: NUMBER
             { 
               $$ = $1;
               printf("Number: %d\n", $$);
             }
             ;

%%

int main() {
    yyparse();
    printf("Parsing completed!\n");
    return 0;
}

void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
