def quicksort(A, p, r):
    if (p < r):
        q = partition(A, p, r)
        quicksort(A, p, q-1)
        quicksort(A, q+1, r)

# when partitioning, data is three parts: smaller, bigger, unknown
def partition(A, p, r):
    x = A[r]
    i = p - 1
    # notice that j is from p to r - 1
    for j in range(p, r):
        if (A[j] <= x):
            i = i + 1
            A[i], A[j] = A[j], A[i]
            
    A[r], A[i+1] = A[i+1], A[r]
    return i + 1
def partition2(A, p, r):
    x = A[r]
    i = p
    # notice that j is from p to r - 1
    for j in range(p, r):
        if (A[j] <= x):
            A[i], A[j] = A[j], A[i]
            i = i + 1
            
    A[r], A[i] = A[i], A[r]
    return i

def partition2(A, si, di):
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
A = [1, 9, 2, 3, -1, 10]
quicksort(A, 0, 5)
print(A)
