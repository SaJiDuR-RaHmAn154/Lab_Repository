#include <stdio.h>   // Standard input/output functions
#include <stdlib.h>  // Standard library functions like malloc, free
#include <unistd.h>  // UNIX standard functions

// Global variables are stored in different memory segments based on initialization
char globBuf[65536];         /* Uninitialized data segment (BSS) */
int primes[] = {2, 3, 5, 7}; /* Initialized data segment (Data) */

// Static function that calculates the square of a number
// Static makes this function only visible within this file
static int square(int x) { 
    int result;      // Local variable stored on the stack
    result = x * x;  // Calculate square
    return result;   // Return the calculated value
}

// Static function that performs calculations and prints results
static void doCalc(int val) {
    printf("The square of %d is %d\n", val, square(val)); // Call square() function
    
    // Conditional block that only executes for values less than 1000
    if (val < 1000) {
        int t;              // Local variable t created on the stack
        t = val * val * val; // Calculate cube
        printf("The cube of %d is %d\n", val, t);
    }
}

// Main function - program entry point
int main(int argc, char *argv[]) {
    static int key = 9973;      /* Initialized data segment */
    static char mbuf[10240000]; /* Uninitialized data segment (BSS) */
    char *p;                    /* Pointer variable allocated in stack frame for main() */
    p = malloc(1024);           /* Allocate 1024 bytes on the heap segment */

    // Print a header for the memory address information
    printf("\nMemory addresses of variables and segments:\n");
    printf("---------------------------------------------------\n");
    
    // Print addresses of various program elements to show memory layout
    printf("Address of function main() (Text): %lu (%p)\n", (unsigned long)main, (void *)main);
    printf("Address of function doCalc() (Text): %lu (%p)\n", (unsigned long)doCalc, (void *)doCalc);
    printf("Address of globBuf (BSS): %lu (%p)\n", (unsigned long)globBuf, (void *)globBuf);
    printf("Address of primes (Initialized Data): %lu (%p)\n", (unsigned long)primes, (void *)primes);
    printf("Address of key (Initialized Data): %lu (%p)\n", (unsigned long)&key, (void *)&key);
    printf("Address of mbuf (BSS): %lu (%p)\n", (unsigned long)mbuf, (void *)mbuf);
    printf("Address of malloc'd memory (Heap): %lu (%p)\n", (unsigned long)p, (void *)p);
    printf("Address of local variable p (Stack): %lu (%p)\n", (unsigned long)&p, (void *)&p);

    doCalc(key);

    free(p);
    return 0;
}
