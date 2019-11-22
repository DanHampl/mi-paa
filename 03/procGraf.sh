#!/bin/sh


# tex
mkdir -p ./data/tex/time
mkdir -p ./data/tex/deviation

for name in "balanced" "light" "heavy" "correlationWeak" "correlationStrong" "bigKnapsack" "smallKnapsack" "smallItems" "smallItemsSmallKnapsack"
do
    # time
    echo '' > ./data/tex/time/$name.tex
    for func in "solvePriceDynamic" "solveHungry" "solveSingle" "fptas" "solveStupid" "solveSmart"
    do
        echo '\\addplot[scatter,scatter src=explicit symbolic]table[meta=label] {\nx y label' >> ./data/tex/time/$name.tex
        for i in 4 10 15 20 #22 25 27 30 32 35 37 40
        do
            var=$(iconv -f utf-16 -t utf-8 ./data/result/$name/$i | grep _$func | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
            var=$(echo "scale=6; $var/500"| bc)
            echo "$i $var $func" >> ./data/tex/time/$name.tex
        done
        echo "};" >> ./data/tex/time/$name.tex
    done

    # deviation
    echo '' > ./data/tex/deviation/$name.tex
    for func in "hungryStupidDeviation" "singleDeviation" "fptasDeviation"
    do
        echo '\\addplot[scatter,scatter src=explicit symbolic]table[meta=label] {\nx y label' >> ./data/tex/deviation/$name.tex
        for i in 4 10 15 20 #22 25 27 30 32 35 37 40
        do

            var=$(iconv -f utf-16 -t utf-8 ./data/result/$name/$i | grep $func | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
            var=$(echo "scale=6; $var/500"| bc)
            echo "$i $var $func" >> ./data/tex/deviation/$name.tex
        done
        echo "};" >> ./data/tex/deviation/$name.tex
    done
done
