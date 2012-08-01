#!/bin/bash

# Fone veikiantis procesas, fltruojantis pelės spūstelėjimus.
# Jei pelė spūsteli ant lango, kurio titule nurodyta (šiuo atveju) "Conky-*" (žvaigždutė reiškia bet kokį tekstą po brūkšnelio), paleidžiamas skriptas, esantis nurodytu adresu (kabutėse). Skriptas pradeda analizuoti pelės koordinates ir sutikrina, ar pelė tikrai paspaudė ant mygtuko. Mygtuko konfigūracijas galima pasirašyti pačiam.

PATH_TO_SCRIPT='/home/my_username/.ConkyClicky/ccaction.sh'
WINDOW_NAME="Conky-*"

xdotool search --name "$WINDOW_NAME" behave %@ mouse-click getmouselocation exec $PATH_TO_SCRIPT

