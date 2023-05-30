#!/bin/bash

DIRS=(0.005 0.1 0.14 0.3 0.4 0.8)
for D in ${DIRS[@]};do
	echo "Training size is ${D}"
	declare -A BY_SEED
	SEEDS=$(ls ./${D}/[0-9]* -d)
	for S in ${SEEDS[@]}; do
		DATA="$(grep '\*\* MAE' ${S}/${S##.*/}cgcnn_train-${D}.out)"
		KEY="${S##.*/}"
#		echo "${S##.*/} ${DATA}"
		for LINE in "${DATA}";do
			[[ "$LINE" =~ [0-9]+\.[0-9]+ ]] && val=${BASH_REMATCH[0]}
			BY_SEED[$KEY]+="${val} "
			echo $LINE
		done
	done
	exit
	for K in ${!BY_SEED[@]};do
		echo "$K ${BY_SEED[$K]}"
	done
	unset BY_SEED
done

