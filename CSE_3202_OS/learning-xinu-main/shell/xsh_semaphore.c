#include <xinu.h>
#include <stdio.h>


void prod2(sid32, sid32), cons2(sid32, sid32);


int32 n = 0; /* Variable n has initial value zero */


shellcmd xsh_semaphore (int nargs, char *args[])
{
    sid32 produced, consumed;
    consumed = semcreate(0);
    produced = semcreate(1);


    resume( create(cons2, 1024, 20, "cons", 2, consumed, produced) );
    resume( create(prod2, 1024, 20, "prod", 2, consumed, produced) );


    //printf("Hello World\n");
    return 0;
}

void prod2 ( sid32 consumed, sid32 produced )
{
    int32 i;
    for( i=1 ; i<=5 ; i++ )
    {
        wait(consumed);
        n++;
        signal(produced);
    }
}

void cons2( sid32 consumed, sid32 produced )
{
    int32 i;
    for( i=1 ; i<=5 ; i++ )
    {
        wait(produced);
        printf("n is %d \n", n);
        signal(consumed);
    }
}
