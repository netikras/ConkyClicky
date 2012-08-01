#!/bin/bash

# Šiuo skriptu gausite reikiamas kursoriaus koordinates.
# Patogu ieškant tikslių mygtuko koordinačių konkrečiame lange (šiuo atveju - "Conky-*")
# Naudojimas:
#	sudo chmod +x getcoords.sh
#		nuveskite pelės kursorių į norimą vietą ir įvykdykite komandą:
#	./getcoords.sh

read X Y screen windowID <<< `xdotool getmouselocation 2>/dev/null|sed 's/x:\(.*\) y:\(.*\) screen:\(.*\) window:\(.*\)/\1 \2 \3 \4/'`

#echo X=$X Y=$Y windowID=$windowID

#koordinatės ekrane
echo
echo Kursoriaus koordinatės ekrane \(x,y\): \($X,$Y\)
windowname=$(xdotool getwindowname $windowID)

  unset x y w h
  eval $(xwininfo -name $windowname |
    sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
           -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
           -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
           -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )


: <<'užkomentuota'
  echo "lango koordinatės: x=$x y=$y, ilgis=$w aukštis=$h"
win_x_L=$x
win_x_R=$((x + w))
win_y_T=$y
win_y_B=$((y + h))
echo distalinės lango koordinatės: x=$win_x_R y=$win_y_B
užkomentuota

# koordinatės lange
XX=$((X - x))
YY=$((Y - y))

echo Kursoriaus koordinatės lange \"$windowname\" \(x,y\): \($XX,$YY\)
echo
