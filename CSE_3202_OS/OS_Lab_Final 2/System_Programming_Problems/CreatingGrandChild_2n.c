#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

const int numChildren = 4;

int main()
{
	int j;
	pid_t childPid;

	setbuf(stdout, NULL);

	for (j = 0; j < numChildren; j++)
	{
		switch (childPid = fork())
		{
		case -1:
			printf("Error: fork failed\n");
			return EXIT_FAILURE;
		case 0:
			printf("%d child,pid=%d\n", j, getpid());
			pid_t grandChildPid = fork();
			if (grandChildPid == 0)
			{
				printf("%d grandchild,pid=%d\n", j, getpid());
				exit(EXIT_SUCCESS);
			}
			else
			{
				exit(EXIT_SUCCESS);
			}

		default:
			printf("%d parent,pid=%d\n", j, getpid());
			wait(NULL);
			break;
		}
	}

	return EXIT_SUCCESS;
}