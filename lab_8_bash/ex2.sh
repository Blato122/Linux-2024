#!/bin/bash

str="zerqu inaiquco tuxxoyuco tomje tok fgcokyor yok cotjucy"

letters=({a..z})

# A+13 = N
# https://medium.com/mkdir-awesome/case-transformation-in-bash-and-posix-with-examples-acdc1e0d0bc4
for ((i=1; i<=24; i++)); do
	trstr="${letters[i]^^}-${letters[25]^^}${letters[0]^^}-${letters[i-1]^^}" # można hardcode środek ZA
	trstr2="${trstr,,}"
	trstrfull=$trstr$trstr2
	echo "ROT"$i":" "$trstrfull"
    result=$(echo "$str" | tr 'A-Za-z' "$trstrfull")
    total_words=$(echo "$result" | wc -w)
    
	matching_words=$(grep -o -w -f lab_07_slownikpl.txt <<< "$result" | wc -l)
	percentage=$((matching_words * 100 / total_words))

	if [ $percentage -gt 30 ]; then
		echo "ponad 30%: "$percentage
		echo "$result"
	else
		echo "poniżej 30%: "$percentage
	fi
done



# rot 20
