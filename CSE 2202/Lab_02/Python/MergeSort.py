import random

def Merge(a,low,mid,high):
    b=[]
    i,j=[low,mid+1]
    while (i<=mid) and (j<=high):
        if a[i]<=a[j]:
            b.append(a[i])
            i+=1
        else:
            b.append(a[j])
            j+=1
    while i<=mid:
        b.append(a[i])
        i+=1
    while j<=high:
        b.append(a[j])
        j+=1
    a[low:high+1]=b

def MergeSort(a,low,high):
    if low==high:return
    elif low==high-1:
        if a[low]>a[high]:a[low],a[high]=a[high],a[low]
    else:
        mid=int((low+high)/2)
        MergeSort(a,low,mid)
        MergeSort(a,mid+1,high)
        Merge(a,low,mid,high)


# File Writting
f=open("MergeSort.txt","w")
n=int(input())
for _ in range(n):
    x=random.randrange(1,3*n)
    f.write(str(x)+'\n')
f.close()

#File Reading
a=[]
f=open("MergeSort.txt","r")
for line in f:
    line=line.strip('\n')
    a.append(int(line))
f.close()
print(f"Unsorted Array->{a}")
MergeSort(a,0,len(a)-1)
print(f"Sorted Array->{a}")






