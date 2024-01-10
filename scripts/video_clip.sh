#!/bin/bash -x
#SBATCH --nodes=32
#SBATCH --gres=gpu:4
#SBATCH --ntasks-per-node=4
#SBATCH --cpus-per-task=6
#SBATCH --wait-all-nodes=1
#SBATCH --job-name=open_clip
#SBATCH --account=ACCOUNT_NAME
#SBATCH --partition PARTITION_NAME

export CUDA_VISIBLE_DEVICES=0,1,2,3
export MASTER_PORT=1224

master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
export MASTER_ADDR=$master_addr

export PYTHONPATH="$PYTHONPATH:$PWD/src"
srun --cpu_bind=v --accel-bind=gn python -u src/training/main.py \
    --save-frequency 1 \
    --report-to tensorboard \
    --train-data="/mnt/hdd0/webvid/results_2M_train_3/0.csv" \
    --val-data="/mnt/hdd0/webvid/results_2M_val_1/0.csv" \
    --csv-img-key videoid \
    --csv-caption-key name \
    --lr=1e-3 \
    --wd=0.1 \
    --warmup 10000 \
    --batch-size=32 \
    --epochs=30 \
    --workers=8 \
    --model RN50 \
    --name "Video-CLIP" \
    --seed 0 \
    --local-loss \
    --gather-with-grad