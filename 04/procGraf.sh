#!/bin/sh


# tex
mkdir -p ./data/tex/time
mkdir -p ./data/tex/deviation
mkdir -p ./data/tex/stats

cnt=1

for name in "balanced" # "light" "heavy" "correlationWeak" "correlationStrong" "bigKnapsack" "smallKnapsack" "smallItems" "smallItemsSmallKnapsack"
do
    # # time
    # echo '' > ./data/tex/time/$name.tex
    # for func in "genetics" "solveSmart"
    # do
    #     echo '\\addplot[scatter,scatter src=explicit symbolic]table[meta=label] {\nx y label' >> ./data/tex/time/$name.tex
    #     for i in 30 35 40 45 #50 55 60
    #     do
    #         var=$(iconv -f utf-16 -t utf-8 ./data/result/$name/$i | grep _$func | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
    #         var=$(echo "scale=6; $var/$cnt"| bc)
    #         echo "$i $var $func" >> ./data/tex/time/$name.tex
    #     done
    #     echo "};" >> ./data/tex/time/$name.tex
    # done

    # # deviation
    # echo '' > ./data/tex/deviation/$name.tex
    # for func in "genDeviation"
    # do
    #     echo '\\addplot[scatter,scatter src=explicit symbolic]table[meta=label] {\nx y label' >> ./data/tex/deviation/$name.tex
    #     for i in 30 35 40 45 #50 55 60
    #     do

    #         var=$(iconv -f utf-16 -t utf-8 ./data/result/$name/$i | grep $func | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
    #         var=$(echo "scale=6; $var/$cnt"| bc)
    #         echo "$i $var $func" >> ./data/tex/deviation/$name.tex
    #     done
    #     echo "};" >> ./data/tex/deviation/$name.tex
    # done

    # stats
    for i in 30-pool300 #35 40 45 #50 55 60
    do
        echo '' > ./data/tex/stats/$name$i.tex
        echo '\\addplot+[scatter,only marks,scatter src=explicit symbolic]table[meta=label] {\nx y label' >> ./data/tex/stats/$name$i.tex
        iconv -f utf-16 -t utf-8 ./data/result/$name/$i | grep stats | tr -s ' '| sed 's/^ *//g' | cut -d" " -f 2,3 | sed 's/^M$//' | sed 's/$/ max/' >> ./data/tex/stats/$name$i.tex
        echo "};" >> ./data/tex/stats/$name$i.tex
        echo '\\addplot+[scatter,only marks,scatter src=explicit symbolic]table[meta=label] {\nx y label' >> ./data/tex/stats/$name$i.tex
        iconv -f utf-16 -t utf-8 ./data/result/$name/$i | grep stats | tr -s ' '| sed 's/^ *//g' | cut -d" " -f 2,4 | sed 's/^M$//' | sed 's/$/ med/' >> ./data/tex/stats/$name$i.tex
        echo "};" >> ./data/tex/stats/$name$i.tex
        echo '\\addplot+[scatter,only marks,scatter src=explicit symbolic]table[meta=label] {\nx y label' >> ./data/tex/stats/$name$i.tex
        iconv -f utf-16 -t utf-8 ./data/result/$name/$i | grep stats | tr -s ' '| sed 's/^ *//g' | cut -d" " -f 2,5 | sed 's/^M$//' | sed 's/\r\n/\n/g' | sed 's/$/ min/' >> ./data/tex/stats/$name$i.tex
        echo "};" >> ./data/tex/stats/$name$i.tex
    done
done
