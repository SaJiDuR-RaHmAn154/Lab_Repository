#include <unistd.h>
#include <stdio.h>

int main() {
    pid_t pid = getpid();
    printf("Parent PID = %d\n", pid);

    return 0;
}
