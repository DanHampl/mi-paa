#!/bin/sh
echo 'x y label' > data/dataSetTime_normal.txt
echo 'x y label' > data/deviation_normal.txt
echo 'x y label' > data/dataSetTime_hard.txt
echo 'x y label' > data/deviation_hard.txt

for i in 4 10 15 20 22 25 27 30 32 35 37 40
do
  var=$(cat data/raw/N$i.txt | grep _solvePriceDynamic | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var dynN" >> data/dataSetTime_normal.txt

  var=$(cat data/raw/N$i.txt | grep _solveHungry | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var hungryN" >> data/dataSetTime_normal.txt

  var=$(cat data/raw/N$i.txt | grep _solveSingle | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var singleN" >> data/dataSetTime_normal.txt

  var=$(cat data/raw/N$i.txt | grep _fptas | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var fptasN" >> data/dataSetTime_normal.txt

  #----------------------------------------------------------------------------------------------------------------------------#

  var=$(cat data/raw/Z$i.txt | grep _solvePriceDynamic | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var dynH" >> data/dataSetTime_hard.txt

  var=$(cat data/raw/Z$i.txt | grep _solveHungry | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var hungryH" >> data/dataSetTime_hard.txt

  var=$(cat data/raw/Z$i.txt | grep _solveSingle | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var singleH" >> data/dataSetTime_hard.txt

  var=$(cat data/raw/Z$i.txt | grep _fptas | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var fptasH" >> data/dataSetTime_hard.txt

  #----------------------------------------------------------------------------------------------------------------------------#

  var=$(cat data/raw/N$i.txt | grep fptasDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var fptasN" >> data/deviation_normal.txt

  var=$(cat data/raw/N$i.txt | grep hungryStupidDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var hungryN" >> data/deviation_normal.txt

  var=$(cat data/raw/N$i.txt | grep singleDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var singleN" >> data/deviation_normal.txt

  #----------------------------------------------------------------------------------------------------------------------------#

  var=$(cat data/raw/Z$i.txt | grep fptasDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var fptasH" >> data/deviation_hard.txt

  var=$(cat data/raw/Z$i.txt | grep hungryStupidDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var hungryH" >> data/deviation_hard.txt

  var=$(cat data/raw/Z$i.txt | grep singleDeviation | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 3| awk '{s+=$1} END {print s}');
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var singleH" >> data/deviation_hard.txt
done
