#!/bin/sh

name="advancedGreedy"

for j in 1 #2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
do

    echo 'x y label' > data/$name$j.txt

    for i in 4 10 15 20 22 25 27 30 32 35 37 40
    do

        kek=$(iconv -f utf-16 -t utf-8 data/raw/N"$i"_5.txt | grep hungryExtendedDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk 'BEGIN{a=   0.0}{if ($1>a) a=$1} END{print a/NR}');
        kek=$(echo "scale=6; $kek"| bc)
        echo "$i $kek $name$j" >> data/$name$j.txt

        # p=$(echo "scale=6; $var/$kek" | bc)
        # echo "$i $p fptas$j" >> data/fptasP_$j.txt

    done
done
