#!/bin/bash

arg=""

# sprawdzenie liczby argumentów:
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

if [[ "${arg}" =~ [^a-zA-Z.] ]]; then
   echo "wykryto nieprawidlowe znaki - dozwolone tylko litery i kropka '.'"
   exit
fi



# w arg jest już prawidłowe wyrażenie regularne
grep "^$arg$" lab_07_slownikpl.txt
exit



sed -n "/^$arg$/p" lab_07_slownikpl.txt
exit



# XD:
# https://stackoverflow.com/questions/1521462/looping-through-the-content-of-a-file-in-bash
# iterowanie po słowach ze słownika:
while read line; do
	# https://www.baeldung.com/linux/bash-string-character-loop
	# chyba niezbyt wydajnie
	match=0
	str=""
	for ((i = 0; i < ${#line} && i < ${#arg}; i++)); do
		char="${line:i:1}"
		arg_char="${arg:i:1}"
		if [[ $arg_char != $char && $arg_char != '.' ]]; then
			break
		else
			str=$str$char
			((match++))
		fi
	done

	if [[ $match -eq ${#arg} && $match -eq ${#line} ]]; then
		echo "$str"
	fi
done < lab_07_slownikpl.txt # spacja ma tu znaczenie? przed lub po "<"



# https://stackoverflow.com/questions/20449543/shell-equality-operators-eq
# https://askubuntu.com/questions/385528/how-to-increment-a-variable-in-bash 

# The issue in your script is with the way you are trying to concatenate characters in the `str` variable. Instead of `((str += $char))`, you should use `str="$str$char"` to concatenate strings. Here's the corrected part of your script:

# double parentheses???
