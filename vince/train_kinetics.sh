#!/usr/bin/env bash

ulimit -n 99999

TITLE="vince"
BASE_LOG_LOCATION="logs"
LOG_LOCATION=${BASE_LOG_LOCATION}"/"${TITLE}

mkdir -p ${LOG_LOCATION}
cp "$(readlink -f $0)" ${LOG_LOCATION}

python3 solver_runner.py \
  --title ${TITLE} \
  --base-logdir ${BASE_LOG_LOCATION} \
  --description r18-b-64-q-16384 \
  --solver VinceSolver \
  --backbone ResNet18 \
  --dataset R2V2Dataset \
  --transform StandardVideoTransform \
  --num-workers 40 \
  --pytorch-gpu-ids 0 \
  --feature-extractor-gpu-ids 0 \
  --batch-size 16 \
  --base-lr 0.03 \
  --vince-embedding-size 64 \
  --vince-queue-size 8192 \
  --vince-momentum 0.999 \
  --vince-temperature 0.07 \
  --epochs 1 \
  --lr-decay-type step \
  --save-frequency 5000 \
  --iterations-per-epoch 5000 \
  --image-log-frequency 5000 \
  --long-save-frequency 10 \
  --log-frequency 10 \
  --input-width 224 \
  --input-height 224 \
  --use-videos \
  --num-frames 4 \
  --inter-batch-comparison \
  --no-save \
  --no-restore \
  --data-path /datasets/Kinetics/kinetics400/images/10fps/
