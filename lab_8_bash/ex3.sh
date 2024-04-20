#!/bin/bash

option=""
# echo "liczba argumentow:" "$#"
if [[ $# -eq 0 ]]; then
	option="--unsolved"
elif [[ $# -eq 1 ]]; then
	if [ $1 != "--solved" ] && [ $1 != "-S" ]; then
        echo "nieprawidlowy argument"
	    exit
    fi	
    option="--solved" # lub $1
else
	echo "nieprawidlowa liczba argumentow"
	exit
fi

# single vs double parentheses
# also, which way of assigning variables is the best?!
# https://stackoverflow.com/questions/1194882/how-to-generate-random-number-in-bash
# https://stackoverflow.com/questions/19327556/get-specific-line-from-text-file-using-just-shell-script

file="lab_07_words_with_defs.txt"

# plik jest posortowany alfabetycznie - ale bez różnicy
random_word() {
    # randomline=$((1 + $RANDOM % $wcount))
    # # randomword=$(awk 'NR==5' $file)
    # randomdef=$(sed -n "${randomline}p" $file) 
    # # double quotes to accept variables!!!
    # # and brackets also so that I can append p later

    local randomline=$(grep -i "^$1" "$file" | shuf -n 1)
    # grep -i --> ignore case
    # shuf -n 1 --> random permutation of at most 1 line --> 1 random line
    local randomword=$(awk '{print $1}' <<< "$randomline")
    local randomdef=$(awk '{$1=""; print ">" $0}' <<< "$randomline")
    # co to jest to <<< ???
    echo "$randomword" "$randomdef" # nic nie dają chyba te cudzysłowy jednak
}

# solution=$(random_word .) # any letter
# https://gist.github.com/jimratliff/d735a57eef05b650d4a17f10b7da64d9
 read -r solution IGNORE <<< "$(random_word .)" # jakim cudem to działa?

clue_defs=()

for ((i = 0; i < ${#solution}; ++i)); do
    char="${solution:i:1}"

    read -r clue clue_def <<< "$(random_word $char)"
    clue_defs+=("$clue_def")

    if [ "$option" == "--solved" ]; then #|| [ "$option" == "-S" ]; then
        echo "|${clue:0:1}|${clue:1:${#clue}-1}"
    else
        clue_hidden=$(echo "$clue" | sed 's/./_|/g')
        echo "|$clue_hidden"
    fi

done

printf '%s\n' "${clue_defs[@]}"

# można dodać że to dodatkowe słowo nie może być takie samo jak główne słowo