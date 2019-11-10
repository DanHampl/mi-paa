#!/bin/sh

echo '' > data/procFptasTime.tex
echo '' > data/procFptasDeviation.tex
echo '' > data/procFptasMaxDeviation.tex

for j in 1 3 5 7 9 #1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19
do

    # echo 'x y label' > data/procFptas_$j.txt
    # echo 'x y label' > data/fptasDeviation_$j.txt
    # echo 'x y label' > data/fptasP_$j.txt

    echo '\\addplot[scatter,scatter src=explicit symbolic]table[meta=label] {' >> data/procFptasTime.tex
    cat "./data/fptasTime_$j.txt" >> data/procFptasTime.tex
    echo "};" >> data/procFptasTime.tex

    echo '\\addplot[scatter,scatter src=explicit symbolic]table[meta=label] {' >> data/procFptasDeviation.tex
    cat "./data/fptasDeviation_$j.txt" >> data/procFptasDeviation.tex
    echo "};" >> data/procFptasDeviation.tex

    # echo '\\addplot[scatter,scatter src=explicit symbolic]table[meta=label] {' >> data/procFptasMaxDeviation.tex
    # cat "./data/fptasDeviationMax_$j.txt" >> data/procFptasMaxDeviation.tex
    # echo "};" >> data/procFptasMaxDeviation.tex

done
