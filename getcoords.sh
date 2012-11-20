#!/bin/bash

# Šiuo skriptu gausite reikiamas kursoriaus koordinates.
# Patogu ieškant tikslių mygtuko koordinačių konkrečiame lange (šiuo atveju - "Conky-*")
# Naudojimas:
#	sudo chmod +x getcoords.sh
#		nuveskite pelės kursorių į norimą vietą ir įvykdykite komandą:
#	./getcoords.sh

eval $(xdotool getmouselocation --shell)

#koordinatės ekrane
echo
echo Kursoriaus koordinatės ekrane \(x,y\): \($X,$Y\)
windowname="Conky-stats"

  unset x y w h
  eval $(xwininfo -id $WINDOW |
    sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
           -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
           -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
           -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )


# koordinatės lange
XX=$((X - x))
YY=$((Y - y))

echo Kursoriaus koordinatės lange \"$windowname\" \(x,y\): \($XX,$YY\)
echo
