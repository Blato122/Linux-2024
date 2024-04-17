#!/bin/bash

a=${1}
b=${2}
c=${3}

echo ${a}
echo ${b}
echo ${c}

minusb=`echo "-($b)" |bc`
two2=`expr 2 \* $a`

if [ $a -ne 0 ]
then
	delta=`echo \( \( $b \* $b \) - \( 4 \* $a \* $c \) \) | bc` 
	if ! $delta -lt 0
	then
		x=`echo "-($delta)" | bc`
        	s=`echo "scale=2; sqrt ( $x )" | bc`
        	echo rozw1:
        	echo "($minusb + $s i) / $twoa"
        	echo rozw2:
        	echo "($minusb - $s i) / $twoa"
	fi
fi

# not finished yet