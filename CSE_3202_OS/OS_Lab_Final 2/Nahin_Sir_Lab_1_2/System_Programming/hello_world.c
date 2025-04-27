#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

/* Global variable for number of children */
const int numChildren = 2; // Set the desired number of child processes

int main() {
    int j;
    pid_t childPid;

    setbuf(stdout, NULL); // Make stdout unbuffered

    for (j = 0; j < numChildren; j++) {
        switch (childPid = fork()) {
        case -1:
            printf("Failed\n");
            return EXIT_FAILURE;
        case 0:
            for(int i=0;i<=5;i++){
                printf("Child i=%d\n",i);
                exit(EXIT_SUCCESS);
            }

        default:
            for(int i=0;i<=5;i++){
                printf("Parent i=%d\n",i);
                wait(NULL); // Wait for child to terminate
            }
            
            break;
        }
    }

    return EXIT_SUCCESS;
}
