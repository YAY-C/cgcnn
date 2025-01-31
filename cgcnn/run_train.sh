#!/bin/bash
#
#SBATCH -n 1
#SBATCH -c 44
#SBATCH --array=0
#SBATCH -J cgcnn-QMOF-train


python main.py --batch-size 16 --n-conv 5 --n-h 1 --train-ratio 0.8 --val-ratio 0.1 --test-ratio 0.1 --workers 4 --epochs 300 --print-freq 1 ./data_test/QMOF > 0cgcnn_train.out
