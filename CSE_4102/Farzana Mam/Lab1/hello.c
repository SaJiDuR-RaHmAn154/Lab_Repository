/* ============================================================================
 * SIMPLE C PROGRAM - BASIC ARITHMETIC DEMONSTRATION
 * ============================================================================
 * This program demonstrates:
 * - Preprocessor directives (#include, #define)
 * - Variable declaration and initialization
 * - Basic arithmetic operations
 * - Output using printf
 * ============================================================================ */

#include<stdio.h>      /* Include standard input/output library for printf function */
#define MAX 100        /* Define a symbolic constant MAX with value 100 (not used in this program) */

/* MAIN FUNCTION: Entry point of every C program */
int main(){
    int a, b, c;       /* Declare three integer variables: a, b, and c */
    
    b = 10;            /* Assign value 10 to variable b */
    c = 20;            /* Assign value 20 to variable c */
    a = b + c;         /* Calculate sum of b and c, store result in variable a */

    printf("a = %d\n", a);  /* Print the value of a using format specifier %d for integers */
    
    return 0;          /* Return 0 to indicate successful program execution */
}