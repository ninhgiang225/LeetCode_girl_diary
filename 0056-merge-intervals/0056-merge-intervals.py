class Solution(object):
    def merge(self, intervals):
        """
        :type intervals: List[List[int]]
        :rtype: List[List[int]]
        """

        # use hash map 

        # Greedy 

        # sort by the first element in the interval 
        intervals.sort()

        merged = [intervals[0]]

        for interval in intervals:
            if merged[-1][1] < interval[0]:
                merged.append(interval) 
            else: 
                merged[-1][1] = max(merged[-1][1], interval[1])

        return merged


        