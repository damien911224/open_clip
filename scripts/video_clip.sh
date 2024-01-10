#!/bin/bash

export CUDA_VISIBLE_DEVICES=0,1,2,3

torchrun --nproc_per_node=4 \
    --rdzv_endpoint=$HOSTE_NODE_ADDR \
    -m ../src/training.main \
    --report-to tensorboard \
    --train-data="/mnt/hdd0/webvid/results_2M_train_3/0.csv" \
    --val-data="/mnt/hdd0/webvid/results_2M_val_1/0.csv" \
    --csv-img-key videoid \
    --csv-caption-key name \
    --model RN50 \
    --lr=1e-3 \
    --wd=0.1 \
    --seed 0 \
    --warmup 10000 \
    --train-num-samples 10968539 \
    --dataset-type csv_video \
    --batch-size 32 \
    --precision amp \
    --workers 16 \