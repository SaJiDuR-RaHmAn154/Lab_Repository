import random

def QuickSort(l,low,high):
    if low >= high: return
    pivot = random.randint(low, high) # choose pivot randomly
    s = low

    # partially sorting the array w.r.t pivot
    for i in range(low, high+1):
        if l[i] <= l[pivot]:
            l[s], l[i] = l[i], l[s]
            s += 1
    if s <= high: l[s], l[pivot] = l[pivot], l[s]
    QuickSort(l, low, pivot-1)
    QuickSort(l, pivot+1, high)

# File Writting
f=open("QuickSort.txt","w")
n=int(input())
for _ in range(n):
    x=random.randrange(1,3*n)
    f.write(str(x)+'\n')
f.close()

#File Reading
l=[]
f=open("QuickSort.txt","r")
for line in f:
    line=line.strip('\n')
    l.append(int(line))
f.close()

print(f"Unsorted Array->{l}")
QuickSort(l,0,len(l)-1)
print(f"Sorted Array->{l}")