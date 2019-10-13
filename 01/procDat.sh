#!/bin/sh

echo 'x y label' > data/dataSetCalls.txt
echo 'x y label' > data/dataSetTime.txt

# stupid N
for i in 4 10 15 20
do
  # cat data/raw/N$i.txt | grep _decideStupid | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1 > data/calls/N$i'_stupid.txt'
  var=$(cat data/raw/N$i.txt | grep _decideStupid | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1);
  var=$(echo "scale=2; $var"| bc)
  echo "$i $var NSt" >> data/dataSetCalls.txt

  var=$(cat data/raw/N$i.txt | grep _decideStupid | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var NSt" >> data/dataSetTime.txt
done

# smart N
for i in 4 10 15 20 22 25 27 30 32 35 37 40
do
  # cat data/raw/N$i.txt | grep _decideSmart | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1 > data/calls/N$i'_smart.txt'
  var=$(cat data/raw/N$i.txt | grep _decideSmart | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1);
  var=$(echo "scale=2; $var"| bc)
  echo "$i $var NSm" >> data/dataSetCalls.txt

  var=$(cat data/raw/N$i.txt | grep _decideSmart | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var NSm" >> data/dataSetTime.txt
done

# stupid Z
for i in 4 10 15 20
do
  # cat data/raw/Z$i.txt | grep _decideStupid | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1 > data/calls/Z$i'_stupid.txt'
  var=$(cat data/raw/Z$i.txt | grep _decideStupid | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1);
  var=$(echo "scale=2; $var"| bc)
  echo "$i $var ZSt" >> data/dataSetCalls.txt

  var=$(cat data/raw/Z$i.txt | grep _decideStupid | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var ZSt" >> data/dataSetTime.txt
done

# smart Z
for i in 4 10 15 20 22 25
do
  # cat data/raw/Z$i.txt | grep _decideSmart | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1 > data/calls/Z$i'_smart.txt'
  var=$(cat data/raw/Z$i.txt | grep _decideSmart | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1);
  var=$(echo "scale=2; $var"| bc)
  echo "$i $var ZSm" >> data/dataSetCalls.txt

  var=$(cat data/raw/Z$i.txt | grep _decideSmart | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 2);
  var=$(echo "scale=6; $var/500"| bc)
  echo "$i $var ZSm" >> data/dataSetTime.txt
done

echo "x y label" >  data/dataSetDetailCalls_stupid.txt
# cat data/raw/FN15.txt | grep _decideStupid | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1 | awk '$0="1 "$0" NSt"' >  data/dataSetDetailCalls_stupid.txt
cat data/raw/FN4.txt | grep _decideStupid | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1 >  data/dataSetDetailCalls_stupid.txt

echo "x y label" >  data/dataSetDetailCalls_smart.txt
# cat data/raw/FN15.txt | grep _decideSmart | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1 | awk '$0="2 "$0" NSm"' >  data/dataSetDetailCalls_smart.txt
cat data/raw/FN4.txt | grep _decideSmart | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1  >  data/dataSetDetailCalls_smart.txt


echo "x y label" >  data/dataSetDetailCallsHard_stupid.txt
# cat data/raw/FN15.txt | grep _decideStupid | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1 | awk '$0="1 "$0" NSt"' >  data/dataSetDetailCalls_stupid.txt
cat data/raw/FZ4.txt | grep _decideStupid | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1 >  data/dataSetDetailCallsHard_stupid.txt

echo "x y label" >  data/dataSetDetailCallsHard_smart.txt
# cat data/raw/FN15.txt | grep _decideSmart | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1 | awk '$0="2 "$0" NSm"' >  data/dataSetDetailCalls_smart.txt
cat data/raw/FZ4.txt | grep _decideSmart | tr -s ' '| sed 's/^ *//g' | cut -d' ' -f 1 | cut -d'/' -f 1  >  data/dataSetDetailCallsHard_smart.txt

