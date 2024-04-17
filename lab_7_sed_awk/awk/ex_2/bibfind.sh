#!/bin/bash

# $0 - script name
# $1 - 1st argument
# "$1" - double quotes because: ?? ?? ?  ?? ? ? (vs none vs single quotes)

opt="$1"
arg="$2"

# damn what is this language...
# https://stackoverflow.com/questions/18568706/check-number-of-arguments-passed-to-a-bash-script
if [ "$#" -ne 2 ]; then
    echo "Illegal number of parameters"
    exit
fi

# turns out that [ is actually a program called test
if [ "$opt" == "-a" ]; then
    # author
    # echo "-a"
    awk -v arg="$arg" -v opt="$opt" -f bibfind.awk publikacje.bib
elif [ "$opt" == "-t" ]; then
    # title
    # echo "-t"
    awk -v arg="$arg" -v opt="$opt" -f bibfind.awk publikacje.bib
elif [ "$opt" == "-k" ]; then
    # keyword
    # echo "-k"
    awk -v arg="$arg" -v opt="$opt" -f bibfind.awk publikacje.bib
else
    # not found
    echo "Option not found"
fi

# działa podawanie stringa całego, a nie tylko słowa
# jest case sensitive
# chyba jest ok