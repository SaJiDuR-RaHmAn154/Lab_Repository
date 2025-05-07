import random

#Iterative approach of Binary Search

def BinarySearchIter(l,x):
    steps=0
    low,high=0,(len(l)-1)
    while low<=high:
        mid=int((low+high)/2)
        if x==l[mid]:
            steps+=1
            print(f"Element is found after:{steps} steps.")
            return
        elif x<l[mid]:
            high=mid-1
        else:
            low=mid+1
        steps+=1
    print(f"Element not found.\nSteps required:{steps}")

#Recursive approach of Binary Search

def BinarySearchRecur(l,i,j,x):
    if i==j:
        if l[i]==x:
            return i
        else:
            return None
    else:
        mid=int((i+j)/2)
        if l[mid]==x:
            return mid
        elif x<l[mid]:
            return BinarySearchRecur(l,i,mid-1,x)
        else:
            return BinarySearchRecur(l,mid+1,j,x)
            

# File Writting

# f=open("BinSearch.txt","w")
# n=int(input())
# for _ in range(n):
#     x=random.randrange(1,2*n)
#     f.write(str(x)+'\n')
# f.close()

#File Reading

l=[]
f=open("BinSearch.txt","r")
for line in f:
    line=line.strip('\n')
    l.append(int(line))
f.close()
x=int(input("Enter the number you want to search:"))
l.sort()
print("*****Iterative Method*****")
BinarySearchIter(l,x)

print("*****Recursive Method*****")
p=BinarySearchRecur(l,0,len(l)-1,x)
if p is not None:
    print(l[p])
    print(f"Element is found at index:{p}")
else:
    print(f"Element is not Found")