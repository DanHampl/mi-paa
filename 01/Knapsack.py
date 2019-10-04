class Item(object):
    def __init__(self, weight, price):
        self.weight = int(weight)
        self.price = int(price)


class Knapsack(object):
    def __init__(self, line):
        data = line.split(' ')
        self.id = data[0]
        self.size = int(data[1])
        self.capacity = int(data[2])
        self.minPrice = int(data[3])
        self.completePrice = 0
        self.completeWeight = 0
        self.items = []
        i = 4
        while i < data.__len__():
            self.items.append(Item(data[i], data[i+1]))
            self.completeWeight += int(data[i])
            self.completePrice += int(data[i+1])
            i += 2
        self.res = None
        self.best = (self.capacity, 0, 0)

    def solveStupid(self):
        self.res = self._solveStupid()

    def _solveStupid(self, used=0, index=0, weight=0, price=0):
        if index == self.size:
            if weight <= self.capacity and price >= self.minPrice:
                return (weight, price, used)
            return (0, 0, used)

        res1 = self._solveStupid(
            used | 1 << index,
            index+1,
            weight+self.items[index].weight,
            price+self.items[index].price,
        )
        res2 = self._solveStupid(
            used,
            index+1,
            weight,
            price,
        )

        if res1[1] < res2[1]:
            return res2
        return res1

    def verify(self, line):
        data = line.split(' ', 3)
        price = 0
        weight = 0
        index = 0
        i = 1
        while self.res[2] >= i:
            if self.res[2] & i:
                weight += self.items[index].weight
                price += self.items[index].price
            i = i << 1
            index += 1
        return self.minPrice == 0 or weight <= self.capacity and price >= self.minPrice or int(data[2]) < self.minPrice

    def solveSmart(self):
        self.res = self._solveSmart(
            self.completePrice,
        )

    def _solveSmart(self,
                    completePrice,
                    used=0,
                    index=0,
                    weight=0,
                    price=0,
                    ):

        if self.best[1] > price + completePrice:
            return (0, 0, used)

        if weight <= self.capacity and price >= self.minPrice:
            if self.best[1] < price:
                self.best = (weight, price, used)
            return (weight, price, used)

        if index == self.size or weight > self.capacity:
            return (0, 0, used)

        res1 = self._solveSmart(
            completePrice - self.items[index].price,
            used | 1 << index,
            index+1,
            weight+self.items[index].weight,
            price+self.items[index].price,
        )
        res2 = self._solveSmart(
            completePrice - self.items[index].price,
            used,
            index+1,
            weight,
            price,
        )

        if res1[1] < res2[1]:
            return res2
        return res1
