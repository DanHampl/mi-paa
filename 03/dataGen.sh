#!/bin/sh
# in
mkdir -p ./data/source/balanced
mkdir -p ./data/source/light
mkdir -p ./data/source/heavy

mkdir -p ./data/source/correlationWeak
mkdir -p ./data/source/correlationStrong

mkdir -p ./data/source/bigKnapsack
mkdir -p ./data/source/smallKnapsack

mkdir -p ./data/source/smallItems
mkdir -p ./data/source/smallItemsSmallKnapsack

# out
mkdir -p ./data/result/balanced
mkdir -p ./data/result/light
mkdir -p ./data/result/heavy

mkdir -p ./data/result/correlationWeak
mkdir -p ./data/result/correlationStrong

mkdir -p ./data/result/bigKnapsack
mkdir -p ./data/result/smallKnapsack

mkdir -p ./data/result/smallItems
mkdir -p ./data/result/smallItemsSmallKnapsack

GEN="./gen/kg2"

for i in 4 10 15 20 22 25 27 30
do
    # kg2 -n inst-size -N inst-num -W num -C num [-a] [-I id] [-m rnum[,rnum]] [-w bal|light|heavy] [-c uni|corr|strong] [-k rnum][PRNG-control]
    $GEN -N 500 -n $i -W 38713 -C 38713 -m 0.8 -w bal -c uni > "./data/source/balanced/$i"
    $GEN -N 500 -n $i -W 38713 -C 38713 -m 0.8 -w light -c uni > "./data/source/light/$i"
    $GEN -N 500 -n $i -W 38713 -C 38713 -m 0.8 -w heavy -c uni > "./data/source/heavy/$i"

    $GEN -N 500 -n $i -W 38713 -C 38713 -m 0.8 -w bal -c corr > "./data/source/correlationWeak/$i"
    $GEN -N 500 -n $i -W 38713 -C 38713 -m 0.8 -w bal -c strong > "./data/source/correlationStrong/$i"

    $GEN -N 500 -n $i -W 38713 -C 38713 -m 0.95 -w bal -c uni > "./data/source/bigKnapsack/$i"
    $GEN -N 500 -n $i -W 38713 -C 38713 -m 0.3 -w bal -c uni > "./data/source/smallKnapsack/$i"

    $GEN -N 500 -n $i -W 100 -C 100 -m 0.8 -w bal -c uni > "./data/source/smallItems/$i"
    $GEN -N 500 -n $i -W 100 -C 100 -m 0.3 -w bal -c uni > "./data/source/smallItemsSmallKnapsack/$i"
done
