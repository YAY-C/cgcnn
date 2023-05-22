#!/bin/bash

DIRS=($(ls -d 0.*))
for D in ${DIRS[@]};do
	cd ./$D
	nohup ./watch_epoch.sh &
	cd ../
done
