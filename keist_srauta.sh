#!/bin/bash
kelias=/home/gymka/Dev/Conky-rss
cid=$(pgrep -f $kelias/.conky)
ccid=$(pgrep cclicky)
kill -9 $cid
kill -9 $ccid
#tiek pakeitus .conky tekstą, tiek su killall -SIGUSR1 conky palūžta. geriau paleist iš naujo, paleidus iš naujo pasikeičia ir lango ID todėl reik ir cclicky paleist iš naujo.
case $1 in
	1)
	#delfi
	sed -i 's/.*Delfi.*Elektronika.*Kauno diena.*/${font :size=11}${color orange}Delfi\.lt: $color${color gray}Elektronika\.lt: Kauno diena: $color${color orange}${hr 2}$color${font}/' $kelias/.conky
	sed -i 's/rss.sh [0-9]/rss.sh 1/' $kelias/.conky
;;
	2)
	#elektronika
	sed -i 's/.*Delfi.*Elektronika.*Kauno diena.*/${font :size=11}${color gray}Delfi\.lt: $color${color orange}Elektronika\.lt: $color${color gray}Kauno diena: $color${color orange}${hr 2}$color${font}/' $kelias/.conky
	sed -i 's/rss.sh [0-9]/rss.sh 2/' $kelias/.conky
;;
	3)	
	#diena
	sed -i 's/.*Delfi.*Elektronika.*Kauno diena.*/${font :size=11}${color gray}Delfi\.lt: Elektronika\.lt: $color${color orange}Kauno diena: ${hr 2}$color${font}/' $kelias/.conky
	sed -i 's/rss.sh [0-9]/rss.sh 3/' $kelias/.conky
esac
killall -9 xdotool
conky -c $kelias/.conky &
sleep 3
xdotool search --name "Conky-stats" behave %@ mouse-click getmouselocation exec $kelias/ccaction.sh
