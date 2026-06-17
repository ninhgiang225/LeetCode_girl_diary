import heapq

class Solution:
    def maxSlidingWindow(self, nums: List[int], k: int) -> List[int]: 
        # Gina lam cau nay
        dq = deque()        # store index: highest to lowest
        ans = []
        for i in range(k):
            while dq and nums[i] > nums[dq[-1]]:
                dq.pop()    # remove last element if the cur is higher 
            dq.append(i)

        ans.append(nums[dq[0]])
        for i in range(k, len(nums)):
            if dq[0] == i - k:
               dq.popleft()

            while dq and nums[i] > nums[dq[-1]]:
                dq.pop() 
            
            dq.append(i)
            ans.append(nums[dq[0]])
    
        return ans 

        