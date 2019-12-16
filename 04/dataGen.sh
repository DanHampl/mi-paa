#!/bin/sh
# in
mkdir -p ./data/source/balanced

# out
mkdir -p ./data/result/balanced

GEN="./gen/kg2"

for i in 30 35 40 45 50 55 60
do
    # kg2 -n inst-size -N inst-num -W num -C num [-a] [-I id] [-m rnum[,rnum]] [-w bal|light|heavy] [-c uni|corr|strong] [-k rnum][PRNG-control]
    $GEN -N 50 -n $i -W 38713 -C 38713 -m 0.5 -w bal -c uni > "./data/source/balanced/$i"
done
