
#! /bin/bash
bubblesortasc() {
	local -n array=$1
        for ((idx1=0;idx1<=${#array[@]}-1;idx1++))
        do
                for((idx2=0;idx2<${#array[@]}-idx1-1;idx2++))
                do
			if [ ${array[idx2]} -gt ${array[$((idx2+1))]} ] 
        		then
            			temp=${array[idx2]}
            			array[$idx2]=${array[$((idx2+1))]}
            			array[$((idx2+1))]=$temp
        		fi
                done
        done
	echo ${array[@]}
}


bubblesortdsc() {
	local -n array=$1
        for ((idx1=0;idx1<=${#array[@]}-1;idx1++))
        do
                for((idx2=0;idx2<${#array[@]}-idx1-1;idx2++))
                do
			if [ ${array[idx2]} -lt ${array[$((idx2+1))]} ] 
        		then
            			temp=${array[idx2]}
            			array[$idx2]=${array[$((idx2+1))]}
            			array[$((idx2+1))]=$temp
        		fi
                done
        done
	echo ${array[@]}
	print_array array
}

print_array () {
        local -n array
        for value in ${array[@]}
        do
                echo -n "$value "
        done
}

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
echo "Sorting in descending order"
bubblesortdsc results
echo "Sorting in ascending order"
bubblesortasc results
