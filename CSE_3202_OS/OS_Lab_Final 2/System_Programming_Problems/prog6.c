#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/* Global variable for number of children */
const int numChildren = 4; // Set the desired number of child processes

int main() {
    int j;
    pid_t childPid;

    setbuf(stdout, NULL); // Make stdout unbuffered

    for (j = 0; j < numChildren; j++) {
        switch (childPid = fork()) {
        case -1:
            printf("Error: fork failed\n");
            return EXIT_FAILURE;
        case 0:
            printf("%d child,pid-%d\n", j,getpid());
            exit(EXIT_SUCCESS);
        default:
            printf("%d parent,pid-%d\n", j,getpid());
            wait(NULL); // Wait for child to terminate
            break;
        }
    }

    return EXIT_SUCCESS;
}