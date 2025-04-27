#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

const int numChildren = 2; 

int main() {
    int j;
    pid_t childPid;

    setbuf(stdout, NULL); 

    for (j = 0; j < numChildren; j++) {
        switch (childPid = fork()) {
        case -1:
            printf("Error: fork failed\n");
            return EXIT_FAILURE;
        case 0:
            printf("Child-%d,Parent-%d\n", getpid(),getppid());
            exit(EXIT_SUCCESS);
        default:
            printf("Parent pid-%d\n", getpid());
            wait(NULL); //waiting for the child process to finish
            break;
        }
    }
	printf("Parent process exiting\n");

    return EXIT_SUCCESS;
}
