#define _GNU_SOURCE /* To get various declarations from <stdlib.h> */
#include <stdio.h>  // Standard input/output functions
#include <stdlib.h> // Standard library functions (environment variables manipulation)

// Run program by using following commands: gcc prog2.c -o prog2 && ./prog2 SHELL=/bin/sh BYE=byebye

// External declaration for the environment variable array
// This array contains pointers to the environment variables in the format "NAME=VALUE"
extern char **environ;

int main(int argc, char *argv[]) {
    int j;          // Loop counter
    char **ep;      // Pointer to environment variables

    // Clear all environment variables from the current process
    // clearenv();

    // Iterate through command-line arguments (starting from index 1 to skip program name)
    for (j = 1; j < argc; j++) {
        printf("Setting environment variable: %s\n", argv[j]); // Print argument before setting
        
        // putenv() adds or changes environment variables
        // It takes a string in the format "NAME=VALUE"
        if (putenv(argv[j]) != 0) {
            printf("Error setting: %s\n", argv[j]); // Display error message if setting fails
        }   
    }

    // setenv() is an alternative way to set environment variables
    // Parameters: variable name, value, and a flag (0 means don't overwrite if exists)
    if (setenv("Sajid", "Hello Sajid", 0) == -1) {
        printf("Error setting GREET\n");
    }

    // // Remove the environment variable "BYE" if it exists
    unsetenv("Sajid");

    // Iterate through all environment variables and print them
    // environ is a NULL-terminated array of pointers to strings
    for (ep = environ; *ep != NULL; ep++) {
        puts(*ep); // Print each environment variable
    }

    return 0; // Exit with success status
}
