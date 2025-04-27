#include <unistd.h>
#include <stdio.h>

int main(){
	pid_t pid = getpid(); // Get the process ID of the current process
	pid_t ppid = getppid(); // Get the parent process ID of the current process
	printf("Parent Process ID: %d\n", ppid); // Print the parent process ID
	printf("Process ID: %d\n", pid); // Print the process ID
}