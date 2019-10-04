import sys
import cProfile
from Knapsack import Knapsack
from time import time_ns


def main():
    problems = open(sys.argv[1], 'r')
    solutions = open(sys.argv[2], 'r')

    tStupid = 0
    tSmart = 0

    line = problems.readline()
    verify = solutions.readline()

    i=0
    while line:
        # Stupid
        k = Knapsack(line)

        x = time_ns()
        k.solveStupid()
        tStupid += time_ns() - x

        if not k.verify(verify):
            print(k.id, 'weight:', k.res[0], 'maxWeight:', k.capacity, 'price:', k.res[1], 'minPrice:', k.minPrice, bin(k.res[2]))

        # Smart
        k = Knapsack(line)

        x = time_ns()
        k.solveSmart()
        tSmart += time_ns() - x

        if not k.verify(verify):
            print(k.id, 'weight:', k.res[0], 'maxWeight:', k.capacity, 'price:', k.res[1], 'minPrice:', k.minPrice, bin(k.res[2]))
        i+=1
        line = problems.readline()
        verify = solutions.readline()

    print(tSmart, tStupid)


if __name__ == "__main__":
    for i in range(100):
        cProfile.run('main()')
    # main()