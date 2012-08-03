#!/bin/bash
kelias=/home/gymka/Dev/Conky-rss
case $1 in
	1) 
	#delfi
	wget -q -O $kelias/rss1.txt 'http://www.delfi.lt/rss/feeds/daily.xml' 
	cp $kelias/~rss-delfi.txt $kelias/~rss-delfi-old.txt	
	grep title $kelias/rss1.txt | sed -n 's/.*<title>\(.*\)<\/title>.*/\1/p'|sed 1,2d|sed -n '1,24p'>$kelias/~rss-delfi.txt
	cat $kelias/~rss-delfi-old.txt>>$kelias/~rss-delfi.txt
	cat $kelias/~rss-delfi.txt|awk ' !x[$0]++'|tail -24|tac>$kelias/rss-delfi.txt #išmetam besidubliuojančias, paliekam tik pirmas 24. 
	cp $kelias/rss-delfi.txt $kelias/~rss-delfi.txt
	cat $kelias/rss-delfi.txt|tac
	rm $kelias/rss1.txt $kelias/~rss-delfi.txt $kelias/~rss-delfi-old.txt
;;
	2)
	#elektronika
	wget -q -O $kelias/rss2.txt http://www.elektronika.lt/rss/visas/
	cp $kelias/~rss-elektronika.txt $kelias/~rss-elektronika-old.txt	
	grep title $kelias/rss2.txt | sed  -n 's/.*<title>\(.*\)<\/title>.*/\1/p'|sed 1,2d|sed -n '1,24p'>$kelias/~rss-elektronika.txt
	cat $kelias/~rss-elektronika-old.txt>>$kelias/~rss-elektronika.txt
	cat $kelias/~rss-elektronika.txt|awk ' !x[$0]++'|tail -24|tac>$kelias/rss-elektronika.txt 
	cp $kelias/rss-elektronika.txt $kelias/~rss-elektronika.txt
	cat $kelias/rss-elektronika.txt|tac
	rm $kelias/rss2.txt $kelias/~rss-elektronika.txt $kelias/~rss-elektronika-old.txt
;;
	3)
	#kauno diena
	wget -q -O $kelias/rss3.txt http://kauno.diena.lt/naujienos/miestas/rss
	sed -i 's/<item>/\n/g' $kelias/rss3.txt
	cp $kelias/~rss-diena.txt $kelias/~rss-diena-old.txt #šitas reiks įrašyt po naujom
	sed -n 's/.*<title><!\[CDATA\[\(.*\)\]\]><\/title>.*/\1/p' $kelias/rss3.txt|sed '1d'>$kelias/~rss-diena.txt 
	cat $kelias/~rss-diena-old.txt>>$kelias/~rss-diena.txt #senas įrašyt po naujom
	cat $kelias/~rss-diena.txt|awk ' !x[$0]++'|tail -24>$kelias/rss-diena.txt 
	cp $kelias/rss-diena.txt $kelias/~rss-diena.txt
	cat $kelias/rss-diena.txt
	rm $kelias/rss3.txt $kelias/~rss-diena.txt $kelias/~rss-diena-old.txt
esac
