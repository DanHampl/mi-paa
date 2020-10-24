#!/bin/sh

name="advancedGreedy"

for j in 1 #2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
do

    echo 'x y label' > data/$name$j.txt

    for i in 4 10 15 20 22 25 27 30 32 35 37 40
    do

        kek=$(iconv -f utf-16 -t utf-8 data/raw_101/N"$i"_5.txt | grep hungryExtendedDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3);#| awk 'BEGIN{a=0.0}{if ($1>$a) a=$1} END{print a}');
        #kek=$(echo "scale=6; $kek/1"| bc)
        echo "$kek" >> data/$name$j-$i.txt

    done
done
