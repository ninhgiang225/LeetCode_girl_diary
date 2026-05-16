class Solution:
    def rotate(self, matrix: List[List[int]]) -> None:
        """
        Do not return anything, modify matrix in-place instead.
        """
        # Gina lam cau nay
        # Tranpose = row_idx -> col_idx, col_idx -> row_idx
        # rotate = tranpose + row reverse 

        # column first

        n = len(matrix)

        for i in range(n):
            for j in range(i+1,n):
                matrix[i][j], matrix[j][i]  = matrix[j][i], matrix[i][j]   

        for i in range(n):
            for j in range(n//2):
                matrix[i][j], matrix[i][n-j-1]  = matrix[i][n-j-1] , matrix[i][j]


                
        