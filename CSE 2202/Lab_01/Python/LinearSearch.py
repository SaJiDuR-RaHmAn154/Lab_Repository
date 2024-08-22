import random
def LinearSearch(l:list,x):
    steps=0
    for i in l:
        if x==i:
            steps+=1
            print("The element is found after",steps,"steps.")
            return 
        steps+=1
    print("Element is not found.\nNumber of steps required:",steps)

#File Writting
# f=open("linSearch.txt","w")
# n=int(input())
# for _ in range(n):
#     x=random.randrange(1,2*n)
#     f.write(str(x)+'\n')
# f.close()

#File Reading
l=[]
f=open("linSearch.txt","r")
for line in f:
    line=line.strip('\n')
    l.append(int(line))
f.close()

x=int(input("Enter the number you want to search:"))
LinearSearch(l,x)



