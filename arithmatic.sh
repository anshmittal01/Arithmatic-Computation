
#! /bin/bash

read -p "enter 1st number " num1
read -p "enter 2nd number " num2
read -p "enter 3rd number " num3

result=$(( num1+num2*num3 ))
result2=$(( num1*num2+num3 ))
