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
        # B&B
        k = Knapsack(line)

        k.solveSmart()

        res = k.res[1]
        # print(res)

        # genetics
        k = Knapsack(line)

        k.genetics()
        print(f'{k.id} genDeviation {k.deviation(res):.4}')#, res, k.res)

        line = problems.readline()
        # verify = solutions.readline()
        break


if __name__ == "__main__":
    for i in range(1):
        cProfile.run('main()')
    # main()