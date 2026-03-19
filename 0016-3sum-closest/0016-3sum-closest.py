class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        
        store_sum = {}

        # brute force, i will sum every 3 elements, calculate the gap between 3sum 
        # and target, take the smallest gap 3sum

        # this might take O(n^3) because we have n*(n-1)*(n-2) subsets

        # another way which is more efficient, use sliding window
        nums = sorted(nums)
        # -4 -1 1 2 
        # -4 -1 2
        # -3 < 1
        # -4 1 2 
        # -1 take this
        
        output = 0
        min_gap = float('inf')
        for i in range(len(nums)-2):
            l, r = i+1, len(nums) - 1
            while l < r:
                sum_of_3 = nums[i] + nums[l] + nums[r]
                if abs(sum_of_3 - target) < min_gap:
                    min_gap = abs(sum_of_3 - target) 
                    output = sum_of_3
                if sum_of_3 < target:
                    l += 1
                elif sum_of_3 > target: 
                    r -= 1
                else: 
                    return sum_of_3
            
        return output
        
        # problem: it just calculate sum of 3 adjacent elements
        # can we really solve it with O(n)
        # seems like we need to sort and use 2 pointer then O(nlogn)
            


