%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
	void yyerror();
	extern int lineno;
	extern int yylex();
%}
%union{
    char str_val[100];
    int int_val;
}

%token INT IF ELSE WHILE CONTINUE BREAK PRINT DOUBLE CHAR
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token<str_val> ID
%token<str_val> ICONST
%token<str_val> FCONST
%token<str_val> CCONST

%type<int_val> type constant exp

%left LT GT /*LT GT has lowest precedence*/
%left ADDOP 
%left MULOP /*MULOP has highest precedence*/


%start code

%%
code: statements;

statements: statements statement | ;

statement:  declaration
           | if_statement
           | ID ASSIGN exp SEMI
           {
            if(idcheck($1)==0)
              yyerror();
            
            if(typecheck(gettype($1),$3)==0)
               yyerror();
           }
            ;

declaration: type ID SEMI
             {
                insert($2, $1);
             }

            |type ID ASSIGN exp SEMI
            ;

type: INT {$$ = INT_TYPE;}
    | DOUBLE {$$ = REAL_TYPE;}
    | CHAR  {$$ = CHAR_TYPE;}
    ;

exp: constant {$$ = $1;}
    | ID      
    { if(idcheck($1)==0)
            yyerror();
      else     
         $$ = gettype($1);
         }
    | exp ADDOP exp
    {
        if(typecheck($1, $3)==0)
           yyerror();
        else
          $$ = typecheck($1, $3);
    }
    | exp MULOP exp
    | exp GT exp
    |exp LT exp
    ;

constant: ICONST {$$ = INT_TYPE;}
        | FCONST  {$$ = REAL_TYPE;}
        | CCONST  {$$ = CHAR_TYPE;}
        ;

if_statement: IF LPAREN exp RPAREN LBRACE statements RBRACE optional_else
        ;

optional_else: ELSE IF LPAREN exp RPAREN LBRACE statements RBRACE 
              | ELSE LBRACE statements RBRACE 
              | 
              ;

%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}
