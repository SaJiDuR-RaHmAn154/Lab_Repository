#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    int j;
    for (j = 0; j < argc; j++)
        printf("argv[%d] = %s\n", j, argv[j]);
    exit(EXIT_SUCCESS);
}
// The main function now takes two arguments: an integer argc and an array of strings argv. The argc argument is the number of command-line arguments, and argv is an array of strings that contains the arguments themselves. The first argument, argv[0], is the name of the program itself. The remaining arguments are the command-line arguments that the user provided when running the program. The program then prints out each argument along with its index in the argv array. Finally, the program exits with a success status code.

// To compile the program, use the following command: ./commandLineArgument Hello World