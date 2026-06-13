class Solution(object):
    def groupAnagrams(self, strs):
        """
        :type strs: List[str]
        :rtype: List[List[str]]
        """
        # gina lam cau nay
        n = len(strs)
        sorted_strs = ["".join(sorted(i) )for i in strs]    # O(N * 100log(100))           
        lookup = {}
        for i in range(n):                                  # O(N)
            if sorted_strs[i] not in lookup:
                lookup[sorted_strs[i]] = [strs[i]]
            else:
                lookup[sorted_strs[i]].append(strs[i])
        
        ans = []

        for i in lookup:                                # O(N)
            ans.append(lookup[i])

        return ans

        # space complexity = 2O(N) = O(N)
        # Time complexity 3O(N) = O(N)
              