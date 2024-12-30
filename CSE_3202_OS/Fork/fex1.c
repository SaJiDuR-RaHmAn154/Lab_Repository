#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>

int main()
{
    fork();// System call (creates a duplicate child process with different process ID)
    fork();
    fork();
    printf("Hello Neso Academy!\n PID = %d\n",getpid());

    return 0;
}