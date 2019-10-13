import sys
import cProfile
from Knapsack import Knapsack


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
        # k = Knapsack(line)

        # k.decideStupid()
        # cProfile.runctx('k.decideStupid()', {}, {'k': k})

        # if not k.verifyDecision(verify):
        #     print(k.id)

        # Smart
        k = Knapsack(line)

        k.decideSmart()
        # cProfile.runctx('k.decideSmart()', {}, {'k': k})

        # if not k.verifyDecision(verify):
        #     print(k.id)
        i+=1
        line = problems.readline()
        verify = solutions.readline()


if __name__ == "__main__":
    for i in range(1):
        cProfile.run('main()')
    # main()