class Solution:
    def findDuplicates(self, nums: List[int]) -> List[int]:
        hashmap = {}
        res = []

        for i in nums:
            if i in hashmap: 
                res.append(i)
            else: 
                hashmap[i] = 0 
        
        return res