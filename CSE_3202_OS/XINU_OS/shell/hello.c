#include<xinu.h>

void proc1(){
    printf("Process 1 : %d\n", getpid());
    while (1){
    }

}

void proc2(){
    printf("Process 2 : %d\n", getpid());
    while (1){
    }
}

void Printer(){
    struct sentry curr;

    for(int i = 0; i < NSEM; i++){
        curr = semtab[i];
        if(curr.sstate == S_USED){
            printf("semid = %d, count = %d\n", i, curr.scount);
        }
    }
}

int hello(){

    sid32 sem1 = semcreate(0);
    sid32 sem2 = semcreate(1);
    sid32 sem3 = semcreate(2);
    sid32 sem4 = semcreate(3);

    printf("ids - %d, %d, %d, %d\n", sem1, sem2, sem3, sem4);

    resume(create(proc1, 1024, 20, "proc1", 0));
    resume(create(proc2, 1024, 20, "proc2", 0));
    resume(create(Printer, 1024, 20, "Printer", 0));

    semreset(sem3, 0);
    semreset(sem4, 0);

    printf("After deleting sem3 and sem4");
    resume(create(Printer, 1024, 20, "Printer", 0));

return 0;
}