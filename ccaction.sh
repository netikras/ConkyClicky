#!/bin/bash


CONFIG_DIR=/home/gymka/Dev/Conky-rss/confs

windowname=Conky-stats
# Get mouse location and set its coordinates to variables X and Y
##################################################################
eval $(xdotool getmouselocation --shell)

# Kursoriaus koordinatės lange $windowname: $XX ir $YY
  unset x y w h
  eval $(xwininfo -id $WINDOW |
    sed -n -e "s/^ \+Absolute upper-left X: \+\([0-9]\+\).*/x=\1/p" \
           -e "s/^ \+Absolute upper-left Y: \+\([0-9]\+\).*/y=\1/p" \
           -e "s/^ \+Width: \+\([0-9]\+\).*/w=\1/p" \
           -e "s/^ \+Height: \+\([0-9]\+\).*/h=\1/p" )



XX=$((X - x))
YY=$((Y - y))

echo Kursoriaus koordinatės ekrane \(x,y\): \($X,$Y\)
echo Kursoriaus koordinatės lange \"$windowname\" \(x,y\): \($XX,$YY\)
echo
##################################################################
############# Buttons ############################################
cd $CONFIG_DIR
# Paimami ir suskaičiuojami visi mygtukai su jų duomenimis iš konfig'o, kurio pavadinimas atitinka paspausto lango pavadinimą
count=`grep ^BUTTON_ Conky-stats | wc -l`
# kiekvieno mygtuko parametrai išrūšiuojami, priskiriami kintamiesiems ir sulyginami su kursoriaus koord.:
while [ $count -gt 0 ]; do
	array=$(cat $windowname|grep BUTTON_$count)

	IFS="\"" # atskirsime paleistiną komandą nuo mygtuko parametrų
	cnt=0 # pagr. skaitliukas
	for var in $array; do # tikrinami mygtuko parametrai ir leistina komanda:
		if [ $cnt == 1 ]; then # paima antrąjį mygtuko configūrac. elementą (leistiną komandą)
			komanda=$var
			echo komanda yra: $komanda; echo
			if [ "$XX" -ge "$button_xL" -a "$XX" -le "$button_xR" -a "$YY" -ge "$button_yT" -a "$YY" -le "$button_yB" ] ; then # sulygina mygtuko ir kursoriaus koord. Jei atitinka, paleidžia komandą
				echo vykdoma komanda
				eval "$komanda"
			fi
			cnt=$(($cnt - 2)) # atstatomas skaitliukas
		else kintamieji=$var; # Jei skaitliukas nepersuktas, paima pirmąjį mygtuko konfigūrac. elementą (parametrus). Juos išskaido, priskiria kintamiesiems. Šie bus (arba ne) panaudoti kito ciklo metu, kai paimsime leistiną komandą ir sutikrinsime koordinates.
			echo kintamieji: $kintamieji
			oldIFS=$IFS
			IFS=" "
			read buttonNo buttonName button_xL button_xR button_yT button_yB <<< $kintamieji
			IFS=$oldIFS
echo priskirtieji kintamieji:  $buttonNo $buttonName $button_xL $button_xR $button_yT $button_yB
		fi
		cnt=$(($cnt + 1))
	done

	count=$(($count - 1))
done


: <<'comment-block'

comment-block

