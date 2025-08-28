#define TYPE_UNDEF 0
#define TYPE_INT 1
#define TYPE_REAL 2
#define TYPE_CHAR 3

extern char *typename[];

typedef struct list_t
{
    char st_name[40];
    int st_type;
    struct list_t *next;    
}list_t;

void insert(char* name, int type);
list_t* search(char *name);
int idcheck(char* name);
int gettype(char *name);
int typecheck(int type1, int type2);
