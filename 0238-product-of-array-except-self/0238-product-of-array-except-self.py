class Solution:
    def productExceptSelf(self, nums: List[int]) -> List[int]:
        # gina lam cau nay
        # nums = [1,2,3,4]
        ans = [0]*len(nums) 
        product = 1 
        track_zero = []
        for idx, num in enumerate(nums):          # O(N)
            if num == 0:     
                track_zero.append(idx)
            else: 
                product *= num 

        if len(track_zero) >= 2:
            return ans  

        if len(track_zero) == 1: 
            ans[track_zero[0]] = product
            return ans 

        # at this len(track_zero) = 0 
        for i in range(len(nums)):      # O(N)
            ans[i] = int(product / nums[i])

        return ans

# time complexity:  O(N) + O(N)  = 2 O(N) 
# space complexity is O(N)
                