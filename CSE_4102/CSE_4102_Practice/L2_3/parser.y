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

%token FUNCTION ID LP COLON INT_TYPE RP BEG RET MOD FLOAT_NUM EQUAL INT_NUM SEMI END
%type<str_val> ID
%type<type_val> type
%type<int_val> exp

%start code

%%
code: func;

func: FUNCTION ID LP param_decl RP BEG RET exp SEMI END
    { 
        int return_type = $8;
        if(return_type != TYPE_INT) {
            printf("In line no %d, Return type mismatch. Expected INT_TYPE but got %s.\n", lineno, typename[return_type]);
        }
    }
;

param_decl: ID COLON type { insert($1, $3); }
;

type: INT_TYPE {$$ = TYPE_INT;} ;

exp: ID { idcheck($1); $$ = gettype($1); } 
   | ID MOD FLOAT_NUM EQUAL INT_NUM { 
       idcheck($1); 
       int var_type = gettype($1);
       int result_type = typecheck(var_type, TYPE_REAL);
       $$ = result_type; 
     } 
   ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Parse error: %s at line %d\n", s, lineno);
}

int main (int argc, char *argv[])
{
    yyparse();
    printf("Parsing finished!\n");
    return 0;
}
