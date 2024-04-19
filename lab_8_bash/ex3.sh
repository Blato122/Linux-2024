#!/bin/bash

echo "liczba argumentow:" "$#"
if [[ $# -eq 0 ]]; then
	echo "nie podano slowa"
	read -p "podaj slowo: " arg
	echo "twoje slowo:" "$arg"
elif [[ $# -eq 1 ]]; then
	arg=$1
	echo "twoje slowo:" "$arg"	
else
	echo "nieprawidlowa liczba argumentow"
	exit
fi

# single vs double parentheses
# also, which way of assigning variables is the best?!
# https://stackoverflow.com/questions/1194882/how-to-generate-random-number-in-bash
# https://stackoverflow.com/questions/19327556/get-specific-line-from-text-file-using-just-shell-script

file="lab_07_words_with_defs.txt"

# wcount=$(wc -l < $file) # missing one?!?!
# ((wcount++))

# plik jest posortowany alfabetycznie
function random_word() {
    # randomline=$((1 + $RANDOM % $wcount))
    # # randomword=$(awk 'NR==5' $file)
    # randomdef=$(sed -n "${randomline}p" $file) 
    # # double quotes to accept variables!!!
    # # and brackets also so that I can append p later

    # randomword=$(awk '{print $1}' <<< "$randomdef")
    # ccount=$(echo -n "$randomword" | wc -m)
    # ccount=${#randomword}
    randomdef=$(grep -i "^$1" "$file" | shuf -n 1)
    # grep -i --> ignore case
    # shuf -n 1 --> random permutation of at most 1 line --> 1 random line
    randomword=$(awk '{print $1}' <<< "$randomdef")
    # co to jest to <<< ???
    echo "$randomword"
}

# echo "$wcount"
# echo "$randomline"
# echo "$randomdef"
rw=$(random_word .) # any letter
# echo "$randomword"
# echo "${#randomword}"

# for ((i = 0; i < ${#rw}; ++i)); do
#     char="${rw:i:1}"
#     extrarw=$(random_word $char)
#     echo "|${extrarw:0:1}|${extrarw:1:${#extrarw}-1}"
# done

for ((i = 0; i < ${#rw}; ++i)); do
    char="${rw:i:1}"
    extrarw=$(random_word $char)
    echo "|${extrarw:0:1}|${extrarw:1:${#extrarw}-1}"
    transformed_word=$(echo "$extrarw" | sed 's/./_|/g')
    echo "|$transformed_word"
done

# dodać punkt 4.
# można dodać że to dodatkowe słowo nie może być takie samo jak główne słowo
# no i to musi podawać definicje poniżej żeby miało sens XD