/* ============================================================================
 * SYMBOL TABLE IMPLEMENTATION FOR C-LIKE LANGUAGE (LAB 5)
 * ============================================================================
 * This file implements a symbol table using a linked list to store:
 * - Variable names and their data types
 * - Functions for insertion, searching, and type checking
 * - Error reporting for undeclared variables and type mismatches
 * - Enhanced support for I/O operations
 * ============================================================================ */

#include "symtab.h"       /* Include symbol table header file */
#include <stdio.h>        /* Standard I/O functions */
#include <stdlib.h>       /* Standard library functions (malloc, free) */
#include <string.h>       /* String manipulation functions (strcpy, strcmp) */

/* ============================================================================
 * GLOBAL VARIABLES
 * ============================================================================ */
list_t *head = NULL;      /* Head pointer for symbol table linked list */
extern int lineno;        /* Current line number (from lexer) for error reporting */

/* Type name array definition */
char *typename[] = {"UNDEF_TYPE", "INT_TYPE", "REAL_TYPE", "CHAR_TYPE"};

/* ============================================================================
 * SYMBOL TABLE FUNCTIONS
 * ============================================================================ */

/* INSERT FUNCTION: Add a new variable to the symbol table */
void insert(char* name, int type)
{
    if(search(name)==NULL)                                  /* Check if variable doesn't already exist */
    {
        list_t* temp = (list_t*)malloc(sizeof(list_t));    /* Allocate memory for new symbol table entry */

        strcpy(temp->st_name, name);                        /* Copy variable name to symbol table entry */
        temp->st_type = type;                               /* Set variable type */

        printf("In line no %d, Inserting %s with type %s in symbol table.\n", lineno, name, typename[type]);

        temp->next = head;                                  /* Link new entry to front of list */
        head = temp;                                        /* Update head to point to new entry */
    }
    else                                                    /* Variable already exists */
    {
        printf("In line no %d, Same variable %s is declared more than once.\n", lineno, name);
    }
}

/* SEARCH FUNCTION: Find a variable in the symbol table */
list_t* search(char *name)
{
    list_t* current = head;                                 /* Start searching from head of list */

    while(current!=NULL)                                    /* Traverse the linked list */
    {
       if(strcmp(name, current->st_name)!=0)               /* If names don't match */
        current = current->next;                           /* Move to next node */
       else                                                /* Names match */
        break;                                             /* Found the variable, exit loop */
    }

    return current;                                         /* Return pointer to found node (or NULL if not found) */
}

/* ID CHECK FUNCTION: Verify if a variable is declared before use */
int idcheck(char* name)
{
    if(search(name)==NULL)                                  /* Variable not found in symbol table */
    {
        printf("In line no %d, ID %s is not declared.\n", lineno, name);
        return 0;                                           /* Return 0 (false) - variable not declared */
    }
    else                                                    /* Variable found */
    {
        return 1;                                           /* Return 1 (true) - variable is declared */
    }
}

/* GET TYPE FUNCTION: Retrieve the data type of a declared variable */
int gettype(char *name)
{
    list_t* temp = search(name);                            /* Search for the variable */

    if(temp==NULL)                                          /* Variable not found */
    {
        printf("In line no %d, ID %s is not declared.\n", lineno, name);
        return UNDEF_TYPE;                                  /* Return undefined type */
    }
    else                                                    /* Variable found */
        return temp->st_type;                               /* Return the variable's type */
}

/* TYPE CHECK FUNCTION: Verify type compatibility between two operands */
int typecheck(int type1, int type2)
{
    if(type1==INT_TYPE && type2==INT_TYPE)                 /* Both operands are integers */
        return INT_TYPE;                                    /* Result is integer type */
    else if (type1==REAL_TYPE && type2==REAL_TYPE)         /* Both operands are real numbers */
        return REAL_TYPE;                                   /* Result is real type */
    else if (type1==CHAR_TYPE && type2==CHAR_TYPE)         /* Both operands are characters */
        return CHAR_TYPE;                                   /* Result is character type */
    else if ((type1==INT_TYPE && type2==REAL_TYPE) || (type1==REAL_TYPE && type2==INT_TYPE))
    {
        /* Mixed int and real operations are allowed, result is real */
        return REAL_TYPE;                                   /* Mixed operations return real type */
    }
    else                                                    /* Type mismatch */
    {
        /* Bounds checking to prevent array access errors */
        if (type1 > 3 || type1 < 0) type1 = 0;            /* Default to UNDEF_TYPE if out of bounds */
        if (type2 > 3 || type2 < 0) type2 = 0;            /* Default to UNDEF_TYPE if out of bounds */

        printf("In line no %d, Data type %s is not matched with Data type %s.\n", lineno, typename[type1], typename[type2]);
        return 0;                                           /* Return 0 (false) for type mismatch */
    }
}

/* PRINT SYMBOL TABLE FUNCTION: Display all variables in the symbol table */
void print_symbol_table()
{
    list_t* current = head;                                 /* Start from head of list */
    printf("\n=== Symbol Table Contents ===\n");
    printf("Variable Name\t\tType\n");
    printf("------------------------\n");
    
    if(current == NULL) {
        printf("(Empty symbol table)\n");
        return;
    }
    
    while(current != NULL) {                               /* Traverse the linked list */
        printf("%-15s\t%s\n", current->st_name, typename[current->st_type]);
        current = current->next;                           /* Move to next node */
    }
    printf("------------------------\n");
}