class Solution(object):
    def minPathSum(self, grid):
        """
        :type grid: List[List[int]]
        :rtype: int
        """

        #topic : dp, inductive reasoning

        m, n = len(grid), len(grid[0])
        dp = [[0]*n for i in range(m)]

        # dp[i, j] = min(sum of all numbers along its path) from (0,0) to (i, j )
        # ans is at dp[-1][-1]

        dp[0][0] = grid[0][0]

        for i in range(1, m):           # O(m)
            dp[i][0] = dp[i-1][0] + grid[i][0]

        for j in range(1, n):           # O(n)
            dp[0][j] = dp[0][j-1] + grid[0][j]    
        
        for i in range(1, m):           # # O(mn)
            for j in range(1, n):
                dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]  


        return dp[-1][-1]

        # space complexity = O(MN)
        # time complexity = O((M*N - M - N - 1) +   # O(m) # O(n) = O(MN)
        