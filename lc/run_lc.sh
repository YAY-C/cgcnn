#!/bin/bash
#
#SBATCH -n 1
#SBATCH -c 16
#SBATCH -J cgcnn-QMOF-lc
#SBATCH --array=0,1,2,3,4,5

TRAIN_SIZES=(0.005 0.14 0.4 0.1 0.3 0.8)

TRAIN=${TRAIN_SIZES[$SLURM_ARRAY_TASK_ID]}

if [[ ! -d ${TRAIN} ]];then
	mkdir ${TRAIN}
fi
cd ./${TRAIN}

DIR_IN='../../data_test/QMOF'
FOUT="cgcnn_train-${TRAIN}.out"

echo "Training model with train ration = ${TRAIN}"
echo "Model Details : \n
	--batch-size 16 --n-conv 5 --n-h 1 --train-ratio ${TRAIN} --val-ratio 0.1 --test-ratio 0.1 --workers 4 --epochs 150 --print-freq 1 ${DIR_IN} > ${FOUT}"

python ../../main.py --batch-size 16 --n-conv 5 --n-h 1 --train-ratio ${TRAIN} --val-ratio 0.1 --test-ratio 0.1 --workers 4 --epochs 150 --print-freq 1 ${DIR_IN}  > ${FOUT}
