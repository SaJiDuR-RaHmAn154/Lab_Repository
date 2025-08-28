%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.h"
	void yyerror();
	extern int lineno;
	extern int yylex();
%}
%union{
    char str_val[100];
    int int_val;
}

%token FUNCTION INT DOUBLE CHAR AS RETURN
%token ADDOP 
%token LPAREN RPAREN LBRACE RBRACE SEMI COMMA
%token<str_val> ID
%token<int_val> ICONST
%token<str_val> FCONST

%type<int_val> type exp
%type<str_val> param

%left ADDOP 

%start program

%%
program: function_def ;

function_def: FUNCTION ID LPAREN param_list RPAREN LBRACE statements RBRACE
            ;

param_list: param_list COMMA param
          | param
          | 
          ;

param: ID AS type
     { 
       insert($1, $3);
     }
     ;

statements: statements statement
          | statement
          ;

statement: RETURN exp SEMI
         { 
           int return_type = $2;
           printf("In line no %d, Function returns type %s.\n", lineno, typename[return_type]);
         }
         ;

exp: ID ADDOP ID
   { 
     idcheck($1); 
     idcheck($3);
     int type1 = gettype($1);
     int type2 = gettype($3);
     $$ = typecheck(type1, type2);
   }
   | ICONST { $$ = INT_TYPE; }
   | FCONST { $$ = REAL_TYPE; }
   ;

type: INT    { $$ = INT_TYPE; }
    | DOUBLE { $$ = REAL_TYPE; }
    | CHAR   { $$ = CHAR_TYPE; }
    ;

%%


int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}

void yyerror()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}
