#!/bin/sh
echo 'x y label' > data/dataSetTime_normal2.txt
echo 'x y label' > data/deviation_normal2.txt
echo 'x y label' > data/dataSetTime_hard2.txt
echo 'x y label' > data/deviation_hard2.txt

j="_5"

for i in 4 10 15 20 22 25 27 30 32 35 37 40
do
  # var=$(cat data/raw/N$i.txt | grep _solvePriceDynamic | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  # var=$(echo "scale=6; $var/500"| bc)
  # echo "$i $var dynN" >> data/dataSetTime_normal2.txt

  # var=$(cat data/raw/N$i.txt | grep _solveHungry | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  # var=$(echo "scale=6; $var/500"| bc)
  # echo "$i $var hungryN" >> data/dataSetTime_normal2.txt

  var=$(iconv -f utf-16 -t utf-8 data/raw/N$i$j.txt | grep _solveHungryExtended | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var singleN" >> data/dataSetTime_normal100.txt

  # var=$(iconv -f utf-16 -t utf-8 data/raw/N$i$j.txt | grep _fptas | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  # var=$(echo "scale=6; $var/500"| bc)
  # echo "$i $var fptasN" >> data/dataSetTime_normal2.txt

  #----------------------------------------------------------------------------------------------------------------------------#

  # var=$(cat data/raw/ZKC$i.txt | grep _solvePriceDynamic | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  # var=$(echo "scale=6; $var/500"| bc)
  # echo "$i $var dynH" >> data/dataSetTime_hard2.txt

  # var=$(cat data/raw/ZKC$i.txt | grep _solveHungry | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  # var=$(echo "scale=6; $var/500"| bc)
  # echo "$i $var hungryH" >> data/dataSetTime_hard2.txt

  var=$(iconv -f utf-16 -t utf-8 data/raw/ZKC$i$j.txt | grep _solveHungryExtended | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var singleH" >> data/dataSetTime_hard100.txt

  # var=$(iconv -f utf-16 -t utf-8 data/raw/ZKC$i$j.txt | grep _fptas | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  # var=$(echo "scale=6; $var/500"| bc)
  # echo "$i $var fptasH" >> data/dataSetTime_hard2.txt

  #----------------------------------------------------------------------------------------------------------------------------#

  # var=$(iconv -f utf-16 -t utf-8 data/raw/N$i$j.txt | grep fptasDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  # var=$(echo "scale=6; $var/500"| bc)
  # echo "$i $var fptasN" >> data/deviation_normal2.txt

  # var=$(cat data/raw/N$i.txt | grep hungryStupidDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  # var=$(echo "scale=6; $var/500"| bc)
  # echo "$i $var hungryN" >> data/deviation_normal.txt

  var=$(iconv -f utf-16 -t utf-8 data/raw/N$i$j.txt | grep hungryExtendedDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var singleN" >> data/deviation_normal100.txt

  #----------------------------------------------------------------------------------------------------------------------------#

  # var=$(iconv -f utf-16 -t utf-8 data/raw/ZKC$i$j.txt | grep fptasDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  # var=$(echo "scale=6; $var/500"| bc)
  # echo "$i $var fptasH" >> data/deviation_hard2.txt

  # var=$(cat data/raw/ZKC$i.txt | grep hungryStupidDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  # var=$(echo "scale=6; $var/500"| bc)
  # echo "$i $var hungryH" >> data/deviation_hard.txt

  var=$(iconv -f utf-16 -t utf-8 data/raw/ZKC$i$j.txt | grep hungryExtendedDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var singleH" >> data/deviation_hard100.txt
done
