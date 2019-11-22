import sys
import cProfile
import pprint
from Knapsack import Knapsack


def main():
    problems = open(sys.argv[1], 'r')
    # solutions = open(sys.argv[2], 'r')
    maxDev = int(sys.argv[2])/10

    tStupid = 0
    tSmart = 0

    line = problems.readline()
    # verify = solutions.readline()

    while line:
        # # Stupid
        # k = Knapsack(line)

        # k.solveStupid()

        # B&B
        k = Knapsack(line)

        k.solveSmart()

        # Dynamic
        k = Knapsack(line)

        k.solvePriceDynamic()

        res = k.res

        # greedy heuristics
        k = Knapsack(line)

        k.solveHungry()
        print(f'{k.id} hungryStupidDeviation {k.deviation(res):.4}')

        # greedy heuristics with single
        k = Knapsack(line)

        k.solveSingle()
        print(f'{k.id} singleDeviation {k.deviation(res):.4}')

        # fptas
        k = Knapsack(line)

        k.fptas(maxDev)
        print(f'{k.id} fptasDeviation {k.deviation(res):.4}')

        line = problems.readline()
        # verify = solutions.readline()


if __name__ == "__main__":
    for i in range(1):
        cProfile.run('main()')
    # main()