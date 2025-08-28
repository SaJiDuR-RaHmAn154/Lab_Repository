/* ============================================================================
 * MAIN PROGRAM - MODULAR PROGRAMMING DEMONSTRATION
 * ============================================================================
 * This file contains the main function that calls functions from other modules
 * Demonstrates how to use functions that are implemented in separate source files
 * ============================================================================ */

#include"hellomake.h"    /* Include our custom header file with function declarations */

/* ============================================================================
 * MAIN FUNCTION: Program entry point
 * ============================================================================ */
int main()
{
    myPrintHelloMake();  /* Call function defined in hellofunc.c */
    return 0;            /* Return success code */
}