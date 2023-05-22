#!/bin/bash



while true; do
	F_in="./epochs.dat"
	if [[ ! -f $F_in ]];then
		touch $F_in
	fi
	SIZE=$(cat $F_in | wc -l)
	
	currentSIZE=$(grep "* MAE" cgcnn_train.out -c)
	
	if [[ $currentSIZE -gt $SIZE ]];then
		grep -e "* MAE" 0cgcnn_train.out > .tmp_raw_epoch
		RESULTS=()
		while read line; do
			[[ "$line" =~ [0-9]+\.[0-9]+ ]] && NUM=${BASH_REMATCH[0]}
			RESULTS+=($NUM)
		done < ./.tmp_raw_epoch
		rm ./epochs.dat
		for i in ${!RESULTS[@]}; do
			echo "${i} ${RESULTS[$i]}" >> epochs.dat
		done
	 
	fi
	if [[ "$currentSIZE" -gt 299 ]];then
		echo "Finished Training"
		exit
	fi
	sleep 600
done
