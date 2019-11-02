#!/bin/sh

for j in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
do

    echo 'x y label' > data/fptasTime_$j.txt
    echo 'x y label' > data/fptasDeviation_$j.txt
    echo 'x y label' > data/fptasDeviationMax_$j.txt
    echo 'x y label' > data/fptasP_$j.txt

    for i in 4 10 15 20 22 25 #27 30 32 35 37 40
    do

        var=$(iconv -f utf-16 -t utf-8 data/raw/N$i.$j.txt | grep _fptas | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
        var=$(echo "scale=6; $var/500"| bc)
        echo "$i $var fptas$j" >> data/fptasTime_$j.txt

        #----------------------------------------------------------------------------------------------------------------------------#

        kek=$(iconv -f utf-16 -t utf-8 data/raw/N$i.$j.txt | grep fptasDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{if ($1!=100.0) s+=$1} END {print s/NR}');
        lines=$(iconv -f utf-16 -t utf-8 data/raw/N$i.$j.txt | grep fptasDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk 'BEGIN{a=   0.0}{if ($1!=100.0) a=a+1} END{print a/NR}');
        kek=$(echo "scale=6; $kek/$lines"| bc)
        echo "$i $kek fptas$j" >> data/fptasDeviation_$j.txt

        # p=$(echo "scale=6; $var/$kek" | bc)
        # echo "$i $p fptas$j" >> data/fptasP_$j.txt

    done
done
