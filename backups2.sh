#!/bin/bash

fecha=$(date +"%Y-%m-%d")
hora=$(date +%H:%M)

arr="`crontab -l | sed 's:/var/.*::' | sed 's:#.*::'| sed 's/.*\/2//g'| sed 's/.*\perl//g'| sed -r 's/[*0-9,>\&$()+%_]+//g'| sed -r 's/[[:space:]]+//g'| tr " \t" "\n" | tr -s "\n"`"
todate=$(date +"%Y%m%d")
cond="`stat -c '%n %y %.19z' $arr| cut -d ' ' -f 2 | sed -r 's/[-]+//g'`" 
#linea="`stat -c '%n %y' $arr|cut -f -2 -d":" --output-delimiter="/var"| sed 's:/var/*.*::'| sed -r 's/[-:0-9]+//g'| sed -r 's/[/]+/,/g'| sed 's/.*\,//g'`"

		for aux in $cond; do
			if [[ $aux -ge $todate ]]; then
				tar -cvf /home/uprog/crontab_bk/$aux'_'$fecha'_'$hora /* $aux
				#echo "Archivo = $lin"
				echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "Se realiza el backup con exito!"
				echo '---------------------------------'
			else
				#echo "Archivo = $lin"
				echo "fecha del sistema: $aux"
				echo "fecha actual: $todate"
				echo "No es necesario realizar el backup: "
				echo '---------------------------------'
			fi
		done