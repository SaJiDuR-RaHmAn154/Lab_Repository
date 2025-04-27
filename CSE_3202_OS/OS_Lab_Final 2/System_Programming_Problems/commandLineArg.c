#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
int main(int argc, char *argv[])
{
	if (!putenv("TEXT=hello"))
		puts(getenv("TEXT"));
	
	if(!unsetenv("TEXT"))
		puts(getenv("TEXT"));
}