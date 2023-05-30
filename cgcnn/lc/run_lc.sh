#!/bin/bash
#
#SBATCH -n 1
#SBATCH -c 16
#SBATCH -J cgcnn-QMOF-lc
#SBATCH --array=0

RAND=$1

TRAIN_SIZES=(0.005 0.14 0.4 0.1 0.3 0.8)
TRAIN_SIZES=(0.8)

TRAIN=${TRAIN_SIZES[$SLURM_ARRAY_TASK_ID]}

DIR_OUT="${TRAIN}/$RAND"

if [[ ! -d $DIR_OUT ]];then
	mkdir $DIR_OUT
fi
cd ./$DIR_OUT

DIR_IN='/home/calvino/ai4cheistry_project/cgcnn/cgcnn/lc/../../data_test/QMOF'
FOUT="${RAND}cgcnn_train-${TRAIN}.out"

echo "Training model with train ration = ${TRAIN}"
echo "Model Details : \n
	--batch-size 16 --n-conv 5 --n-h 1 --train-ratio ${TRAIN} --val-ratio 0.1 --test-ratio 0.1 --workers 4 --epochs 150 --print-freq 1 ${DIR_IN} > ${FOUT}"

python /home/calvino/ai4cheistry_project/cgcnn/cgcnn/main.py \
	--batch-size 16 --n-conv 5 --n-h 1 \
	--train-ratio ${TRAIN} --val-ratio 0.1 --test-ratio 0.1 \
	--workers 4 \
	--epochs 150 \
	--random_seed $RAND \
	--print-freq 1 ${DIR_IN}  > ${FOUT}
