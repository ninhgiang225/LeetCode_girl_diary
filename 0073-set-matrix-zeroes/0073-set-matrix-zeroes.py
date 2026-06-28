class Solution:
    def setZeroes(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        m, n = len(matrix), len(matrix[0])
        print(m,n)
        storage = [False]*(m+n)         # space O(m+n)

        for i in range(m):
            if matrix[i][0] == 0: 
                storage[i] = True

        for j in range(n):
            if matrix[0][j] == 0:
                storage[j+m] = True  
   

        for i in range(m):
            for j in range(n):
                if matrix[i][j] == 0: 
                    matrix[i][0], matrix[0][j] = 0, 0 
                    storage[i], storage[j+m] = True, True

        for i in range(m):
            if storage[i]: 
                for j in range(n):
                    matrix[i][j] = 0 

        for j in range(n):
            if storage[j+m]: 
                for i in range(m):
                    matrix[i][j] = 0   

        