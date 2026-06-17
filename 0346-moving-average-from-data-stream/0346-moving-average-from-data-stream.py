class MovingAverage:

    def __init__(self, size: int):
        self.size = size
        self.sum = 0 
        self.list = []

    def next(self, val: int) -> float:
        self.list.append(val)
        self.sum += val

        if len(self.list) <= self.size:
            return self.sum / len(self.list)
        else:
            first_element = self.list.pop(0)
            self.sum -= first_element
            return self.sum / self.size
