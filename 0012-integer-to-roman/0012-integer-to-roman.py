class Solution:
    def intToRoman(self, num: int) -> str:
        hashmap = {1: 'I', 5: 'V', 10: 'X', 50: 'L', 100: 'C', 500: 'D', 1000: 'M'}
        # 3749
        string = str(num)
        element = {}
        n = len(string) # 4

        for i in range(len(string)):
            element[i] = [int(string[i]), 10**(n-(i+1))]
        output = ""

        for i in element:
            num = element[i][0]
            count_zeros = element[i][1]
            print(num, count_zeros)
            if num <= 3: 
                output += hashmap[count_zeros]*num
            elif num == 4: 
                output += hashmap[count_zeros]
                output += hashmap[count_zeros*5]
            elif num >= 5 and num < 9: 
                output += hashmap[count_zeros*5]
                output += hashmap[count_zeros]*(num-5)
            else:   #i = 9 
                output += hashmap[count_zeros]
                output += hashmap[count_zeros*10]
        
        return output
