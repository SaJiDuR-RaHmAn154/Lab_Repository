#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    printf("PID of ex1.c = %d\n", getpid());
    char *args[] = {"Hello", "Neso", "Academy", NULL};
    execv("./ex2",args);//system call (Replacing a process content with another process. Process ID will remain same)
    printf("Back to ex1.c");// This line won't be executed as there is such command in ex2.c tho go back to the previous process
    return 0;
}