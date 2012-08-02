#!/bin/bash
case $1 in
	1) 
	wget -q -O rss.txt 'http://www.delfi.lt/rss/feeds/daily.xml' 
	grep title rss.txt | sed -n 's/.*<title>\(.*\)<\/title>.*/\1/p'|sed 1,2d|sed -n '1,24p'
	rm rss.txt
;;
	2)
	wget -q -O rss.txt rss.txt http://www.elektronika.lt/rss/visas/
	grep title rss.txt | sed -n 's/.*<title>\(.*\)<\/title>.*/\1/p'|sed 1,2d|sed -n '1,24p'
	rm rss.txt
;;
	3)
	wget -q -O rss.txt http://kauno.diena.lt/naujienos/miestas/rss
	sed -i 's/<item>/\n/g' rss.txt
	sed -n 's/.*<title><!\[CDATA\[\(.*\)\]\]><\/title>.*/\1/p' rss.txt|sed '1d'
	rm rss.txt
esac
