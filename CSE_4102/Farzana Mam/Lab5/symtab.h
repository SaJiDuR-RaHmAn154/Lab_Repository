/* ============================================================================
 * SYMBOL TABLE HEADER FILE FOR C-LIKE LANGUAGE (LAB 5)
 * ============================================================================
 * This header defines:
 * - Type constants for different data types
 * - Symbol table data structure (linked list node)
 * - Function prototypes for symbol table operations
 * - Enhanced for I/O operations support
 * ============================================================================ */

#ifndef SYMTAB_H
#define SYMTAB_H

/* ============================================================================
 * TYPE CONSTANTS - Used to identify different data types
 * ============================================================================ */
#define UNDEF_TYPE 0          /* Undefined type (for errors) */
#define INT_TYPE 1            /* Integer type */
#define REAL_TYPE 2           /* Real/Float/Double type */
#define CHAR_TYPE 3           /* Character type */

/* ============================================================================
 * TYPE NAME ARRAY - String representations of type constants
 * ============================================================================ */
extern char *typename[];      /* External declaration - defined in symtab.c */

/* ============================================================================
 * SYMBOL TABLE STRUCTURE - Linked list node for storing symbol information
 * ============================================================================ */
typedef struct list_t
{
    char st_name[40];         /* Variable name (up to 40 characters) */
    int st_type;              /* Variable type (using type constants above) */
    struct list_t *next;      /* Pointer to next symbol table entry */
}list_t;

/* ============================================================================
 * FUNCTION PROTOTYPES - Symbol table operations
 * ============================================================================ */
void insert(char* name, int type);      /* Insert new variable into symbol table */
list_t* search(char *name);             /* Search for variable in symbol table */
int idcheck(char* name);                /* Check if variable is declared */
int gettype(char *name);                /* Get type of a declared variable */
int typecheck(int type1, int type2);    /* Check type compatibility between operands */
void print_symbol_table();              /* Print contents of symbol table */

#endif /* SYMTAB_H */