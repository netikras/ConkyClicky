#!/bin/bash

# Fone veikiantis procesas, fltruojantis pelės spustelėjimus.
# Jei pele spusteli ant lango, kurio pavadinime nurodyta (šiuo atveju) „Conky-*“ (žvaigždutė reiškia bet kokį tekstą po brūkšnelio), paleidžiamas scenarijus, esantis nurodytu adresu (kabutėse). Scenarijus pradeda analizuoti pelės koordinates ir sutikrina, ar pelė tikrai paspaudė ant mygtuko. Mygtuko konfigūracijas galima pasirašyti pačiam.

PATH_TO_SCRIPT='/home/my_username/.ConkyClicky/ccaction.sh'
WINDOW_NAME="Conky-*"

xdotool search --name "$WINDOW_NAME" behave %@ mouse-click getmouselocation exec $PATH_TO_SCRIPT

