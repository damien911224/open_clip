#!/bin/bash

export CUDA_VISIBLE_DEVICES=0,1,2

cd ../src
torchrun --nproc_per_node=3 \
    --rdzv_endpoint=$HOSTE_NODE_ADDR \
    -m training.main \
    --report-to tensorboard \
    --dataset-root-folder="/mnt/hdd0/webvid/data/videos" \
    --train-data="/mnt/hdd0/webvid/results_2M_train_3/0.csv" \
    --val-data="/mnt/hdd0/webvid/results_2M_val_1/0.csv" \
    --csv-img-key videoid \
    --csv-caption-key name \
    --model RN50 \
    --name "Video-CLIP" \
    --lr=1e-4 \
    --wd=0.1 \
    --epochs=30 \
    --seed 0 \
    --warmup 10000 \
    --dataset-type csv_video \
    --data-type "videos" \
    --batch-size 16 \
    --max-seq-len 16 \
    --precision amp \
    --workers 16
#    --local-loss \
#    --train-num-samples 829103 \
#    --gather-with-grad