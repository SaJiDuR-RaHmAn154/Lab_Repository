import random

#Iterative approach of MinMax Algorithm

def MinMaxIter(l):
    max=min=l[0]
    for x in l:
        if x>=max : max=x
        elif x<min : min=x
    return max,min

#Recursive approach of MinMax Algorithm

def MinMaxRecur(l,i,j):
    if i==j :return l[i],l[i]
    elif i==j-1:
        if l[i]<=l[j]:return l[j],l[i]
        else:return l[i],l[j]
    else:
        mid=int((i+j)/2)
        max,min = MinMaxRecur(l,i,mid)
        max1,min1 = MinMaxRecur(l,mid+1,j)

        if max1>max:max=max1
        if min1<min:min=min1
        return max,min


# File Writting
f=open("MinMax.txt","w")
n=int(input())
for _ in range(n):
    x=random.randrange(1,3*n)
    f.write(str(x)+'\n')
f.close()

#File Reading
l=[]
f=open("MinMax.txt","r")
for line in f:
    line=line.strip('\n')
    l.append(int(line))
f.close()

print("****Iterative MinMax****")
max,min=MinMaxIter(l)
print(f"Max Element:{max}\nMin ELement:{min}")

print("****Recursive MinMax****")
max,min=MinMaxRecur(l,0,len(l)-1)
print(f"Max Element:{max}\nMin ELement:{min}")

