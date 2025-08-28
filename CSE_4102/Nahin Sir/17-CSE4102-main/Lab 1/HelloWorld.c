/* ============================================================================
 * HELLO WORLD PROGRAM - COMPILATION PROCESS DEMONSTRATION
 * ============================================================================
 * This program demonstrates basic C programming concepts and includes
 * compilation commands as comments to show the complete compilation pipeline
 * ============================================================================ */

#include<stdio.h>        /* Include standard input/output library for printf function */

/* MAIN FUNCTION: Entry point of every C program */
int main()
{
    int a, b, c;         /* Declare three integer variables for arithmetic demonstration */
    
    b = 10;              /* Initialize variable b with value 10 */
    c = 20;              /* Initialize variable c with value 20 */
    a = b + c;           /* Calculate sum of b and c, store result in a (a = 30) */
    
    printf("a = %d\n", a);  /* Print the result using printf with integer format specifier */
    
    /* ========================================================================
     * COMPILATION COMMANDS (for educational reference)
     * ========================================================================
     * These commands show the complete C compilation pipeline:
     * ======================================================================== */
    
    //gcc -o HelloWorld HelloWorld.c              /* Direct compilation: source -> executable */
    //gcc -E HelloWorld.c > HelloWorld.i          /* Preprocessing: expand macros and includes */
    //gcc -S -masm=intel HelloWorld.i             /* Compilation: generate Intel-syntax assembly */
    //as -o HelloWorld.o HelloWorld.s             /* Assembly: convert assembly to object code */
    //objdump -M intel -d HelloWorld.o > HelloWorld.dump  /* Disassembly: view machine code */
    
    return 0;            /* Return 0 to indicate successful program execution */
}