#!/bin/bash

function FIBONACCI_92 ()
{

INPUT=92
FBC_2=0
FBC_1=1
FBC_i=0

for (( i=2; $i <= $INPUT; i++ ))
do
  FBC_i=$(expr $FBC_2 + $FBC_1)
  FBC_2=$FBC_1
  FBC_1=$FBC_i
done

}


function FIBONACCI__92_10times ()
{
KROTNOSC=10
for (( a=1; a<=$KROTNOSC; a++))
do
FIBONACCI_92
done
}


