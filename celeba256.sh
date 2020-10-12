#!/bin/bash

BS=16
GPU_ID=0
MAX_GITER=125000
DATA_PATH=./data_PAI
DATASET=celeba128
DATAROOT=${DATA_PATH}
ISIZE=512
NC=3
NOISE_DIM=100

MODEL=cfgangp
DOUT_DIM=1
NUM_FREQS=8
WEIGHT=gaussian_ecfd
SIGMA=0.

cmd="python src/main.py\
 --dataset ${DATASET}\
 --dataroot ${DATAROOT}\
 --model ${MODEL}\
 --gen resnet
 --disc dcgan5
 --batch_size ${BS}\
 --image_size ${ISIZE}\
 --nc ${NC}\
 --noise_dim ${NOISE_DIM}\
 --dout_dim ${DOUT_DIM}\
 --max_giter ${MAX_GITER}\
 --resultsroot ./out256
 --gpu_device ${GPU_ID}"

if [ ${MODEL} == 'cfgangp' ]; then
    cmd+=" --num_freqs ${NUM_FREQS} --weight ${WEIGHT} --sigmas ${SIGMA}"
fi

echo $cmd
eval $cmd

