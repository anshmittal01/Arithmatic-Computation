
#! /bin/bash

print_dict () {
        eval "declare -A dict="${1#*=}
        for key in ${!dict[@]}
        do
                echo -e "$key \t ${dict[$key]}"
        done
}

read -p "enter 1st number " num1
read -p "enter 2nd number " num2
read -p "enter 3rd number " num3

result1=$(( num1+num2*num3 ))
result2=$(( num1*num2+num3 ))
result3=$(( num3+num1/num2 ))
result4=$(( num1%num2+num3 ))

declare -A compute
compute=( ["a+b*c"]=$result1 ["a*b+c"]=$result2 ["c+a/b"]=$result3 ["a%b+c"]=$result4 )

print_dict "$(declare -p compute)"
index=0
for value in ${compute[@]}
do
        results[$index]=$value
	(( index++ ))
done
echo "${results[@]}"
