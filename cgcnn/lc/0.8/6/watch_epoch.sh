#!/bin/bash

TRAINSIZE="0.8"
while true; do
	F_in="./epochs.dat"
	if [[ ! -f $F_in ]];then
		touch $F_in
	fi
	SIZE=$(cat $F_in | wc -l)
	
	currentSIZE=$(grep "* MAE" 6cgcnn_train-${TRAINSIZE}.out -c)
	
	if [[ $currentSIZE -gt $SIZE ]];then
		grep -e "* MAE" 6cgcnn_train-${TRAINSIZE}.out > .tmp_raw_epoch
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
	if [[ "$currentSIZE" -gt 148 ]];then
		echo "Finished Training"
		rm .tmp_raw_epoch
		exit
	fi
	sleep 600
done
