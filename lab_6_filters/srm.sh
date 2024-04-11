#!/bin/bash

# Napisz skrypt “bezpiecznego usuwania” srm.sh, który podane jako argumenty pliki skompresuje (o ile już nie są skompresowane - należy to sprawdzić, np. przy pomocy polecenia file)
# a następnie przeniesie je do folderu /home/user/trash. Przy wywołaniu skrypt powinien sprawdzić folder trash i usunąć z niego pliku starsze niż 48 godzin.

# https://stackoverflow.com/questions/255898/how-to-iterate-over-arguments-in-a-bash-script

find /home/`whoami`/trash -type f -mtime +2 -exec rm {} \;

user=`whoami`

for f in "$@" # $@ - wszystkie argumenty
do
	if ! file "$f" | grep -q compressed
	then
		tar cfz "/home/${user}/trash/${f}.tgz" "$f"
		rm "$f"
	fi
done
