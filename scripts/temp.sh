HOSTs=(	
		TWR_PLT1
		GND1
		TWR1
		IG3
		IG30
			)

for HOST in "${HOSTs[@]}"
do
    ssh ${HOST}
    echo "Температурные показатели ${HOST}"
    paste <(cat /sys/class/thermal/thermal_zone*/type) <(cat /sys/class/thermal/thermal_zone*/temp) | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/'
    echo
done


        #SIF-TT#
	    #DRS-TT
		#SVO
		#DME
		#VKO
		#DRS	
		#TWR_PLT1
		#TWR_PLT2
		#TWR_PLT3
		#TWR_PLT4
		#GND1
		#GND2
		#GND3
		#TWR1
		#TWR2
		#TWR3
		#TWR_TSUP
		#TWR_SUP
		#IG1
		#IG2
		#IG3
		#IG4
		#IG5
		#IG6
		#IG7
		#IG8
		#IG9
		#IG10
		#IG11
		#IG12
		#IG13
		#IG14
		#IG15
		#IG16
		#IG17
		#IG18
		#IG19
		#IG20
		#IG21
		#IG22
		#IG23
		#IG24
		#IG25
		#IG26
		#IG27
		#IG28
		#IG29
		#IG30