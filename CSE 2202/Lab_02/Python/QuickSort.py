import random

def QuickSort(l, low, high):
    if low >= high: return
    pivot_idx = random.randint(low, high)  # choose pivot randomly
    l[pivot_idx], l[high] = l[high], l[pivot_idx]  # move pivot to end
    pivot = l[high]
    s = low

    # partially sorting the array w.r.t pivot
    for i in range(low, high):
        if l[i] <= pivot:
            l[s], l[i] = l[i], l[s]
            s += 1
    l[s], l[high] = l[high], l[s]  # place pivot in its correct sorted position
    QuickSort(l, low, s - 1)
    QuickSort(l, s + 1, high)

# File Writing
f=open("QuickSort.txt","w")
n=int(input())
for _ in range(n):
    x=random.randrange(1,3*n)
    f.write(str(x)+'\n')
f.close()

# File Reading
l=[]
f=open("QuickSort.txt","r")
for line in f:
    line=line.strip('\n')
    l.append(int(line))
f.close()

print(f"Unsorted Array->{l}")
QuickSort(l,0,len(l)-1)
print(f"Sorted Array->{l}")
