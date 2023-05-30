#!/bin/bash

SEEDS=(6 12 121)

for S in ${SEEDS[@]};do
	JOBNAME="${S}-cgcnn-QMOF-lc"
	echo "Launching job array for random seed = $S"
	sbatch -J $JOBNAME ./run_lc.sh $S
	JOBS=$(squeue -u calvino -n $JOBNAME -h | wc -l)
	while [[ "$JOBS" -gt 2 ]];do
		sleep 180
		JOBS=$(squeue -u calvino -n $JOBNAME -h | wc -l)
	done
	echo "Finished training with all random seeds !!"
done
