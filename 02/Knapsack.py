from math import log


class Item(object):
    def __init__(self, weight, price):
        self.weight = int(weight)
        self.price = int(price)


class Knapsack(object):
    def __init__(self, line, minPrice = False):
        data = line.split(' ')
        self.id = data[0]
        self.size = int(data[1])
        self.capacity = int(data[2])
        if minPrice:
            self.minPrice = int(data[3])
        self.completePrice = 0
        self.completeWeight = 0
        self.items = []
        i = 4 if minPrice else 3
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
            if weight <= self.capacity:
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
        return int(line.split(' ', 3)[2]) == self.res

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

        if self.best[1] >= price + completePrice:
            return (0, 0, used)

        if weight > self.capacity:
            return (0, 0, used)

        if index == self.size:
            if weight <= self.capacity:
                if self.best[1] < price:
                    self.best = (weight, price, used)
                return (weight, price, used)
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

    def decideStupid(self):
        self.res = False
        self._decideStupid()

    def _decideStupid(self, index=0, weight=0, price=0):
        if self.res:
            return

        if index == self.size:
            if weight <= self.capacity and price >= self.minPrice:
                self.res = True
            return

        res1 = self._decideStupid(
            index+1,
            weight+self.items[index].weight,
            price+self.items[index].price,
        )
        res2 = self._decideStupid(
            index+1,
            weight,
            price,
        )

        return

    def verifyDecision(self, line):
        # print(int(line.split(' ', 3)[2]), self.minPrice, self.res)
        return (int(line.split(' ', 3)[2]) >= self.minPrice) == self.res

    def decideSmart(self):
        self.res = False
        self._decideSmart(
            self.completePrice,
        )

    def _decideSmart(self,
                     completePrice,
                     index=0,
                     weight=0,
                     price=0,
                     ):

        if (self.res or
            self.minPrice > price + completePrice or
                self.capacity < weight):
            return

        if index == self.size:
            if weight <= self.capacity and price >= self.minPrice:
                self.res = True
            return

        res1 = self._decideSmart(
            completePrice - self.items[index].price,
            index+1,
            weight+self.items[index].weight,
            price+self.items[index].price,
        )
        res2 = self._decideSmart(
            completePrice - self.items[index].price,
            index+1,
            weight,
            price,
        )

        return

    def solvePriceDynamic(self):
        self.res = self._solvePriceDynamic()

    def _solvePriceDynamic(self):
        d = {}
        d[0] = 0
        for item in self.items:
            newD = d.copy()
            for p, w in d.items():
                newD[item.price + p] = item.weight + w if item.price + \
                    p not in d or d[item.price + p] > w + item.weight else d[item.price + p]
            d = newD
        pMax = 0
        for p, w in d.items():
            if pMax < p and w <= self.capacity:
                pMax = p
        return pMax

    def solveHungry(self):
        self.res = self._solveHungry()

    def _solveHungry(self):
        self.items.sort(key=lambda x: x.weight/x.price)
        price = 0
        weight = 0
        for i in self.items:
            if (weight + i.weight) <= self.capacity:
                weight += i.weight
                price += i.price
        return price

    def deviation(self, exactResult):
        if exactResult == 0:
            if self.res == 0:
                return 0.0
            return 100.0
        return abs((exactResult-self.res)/exactResult)*100

    def solveSingle(self):
        self.res = self._solveSingle()

    def _solveSingle(self):
        self.items.sort(key=lambda x: x.weight/x.price)
        price = 0
        weight = 0
        maxSingle = 0
        for i in self.items:
            if (weight + i.weight) <= self.capacity:
                weight += i.weight
                price += i.price
            if (i.weight > maxSingle):
                maxSingle = i.weight
        return price if price > maxSingle else maxSingle

    def solveHungryExtended(self):
        self.res = self._solveHungryExtended()

    def _solveHungryExtended(self):
        self.items.sort(key=lambda x: x.weight/x.price)
        price = 0
        weight = 0
        maxSingle = 0
        singlePrice = 0
        for i in self.items:
            if (weight + i.weight) <= self.capacity:
                weight += i.weight
                price += i.price
            if i.price > maxSingle and i.weight <= self.capacity:
                maxSingle = i.price
        return price if price > maxSingle else maxSingle

    def fptas(self, maxDev):
        maxPrice = 0
        for i in self.items:
            maxPrice = maxPrice if i.price<maxPrice else i.price

        shift = maxDev*maxPrice/len(self.items)

        for i in self.items:
            i.price = int(i.price/shift)

        self.res = int(self._fptas()*shift)
        return

    def _fptas(self):
        d = {}
        d[0] = 0
        for item in self.items:
            newD = d.copy()
            for p, w in d.items():
                newD[item.price + p] = item.weight + w if item.price + \
                    p not in d or d[item.price + p] > w + item.weight else d[item.price + p]
            d = newD
        pMax = 0
        for p, w in d.items():
            if pMax < p and w <= self.capacity:
                pMax = p
        return pMax
