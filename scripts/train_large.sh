#!/bin/bash

set -euxo pipefail

MODEL_FILE=/mnt/data/pretrained/bert/enliple/large_v1/large_v1_model.bin
CONFIG_FILE=/mnt/data/pretrained/bert/enliple/large_v1/large_config.json
VOCAB_FILE=/mnt/data/pretrained/bert/enliple/large_v1/large_v1_32k_vocab.txt
TRAIN_FILE=/mnt/data/datasets/korquad/v1.0/KorQuAD_v1.0_train.json

python3 src/run_qa.py \
  --checkpoint "$MODEL_FILE" \
  --config_file "$CONFIG_FILE" \
  --vocab_file "$VOCAB_FILE" \
  --train_file "$TRAIN_FILE" \
  --max_seq_length 512 \
  --doc_stride 128 \
  --max_query_length 64 \
  --max_answer_length 30 \
  --per_gpu_train_batch_size 16 \
  --learning_rate 5e-5 \
  --num_train_epochs 4.0 \
  --adam_epsilon 1e-6 \
  --warmup_proportion 0.1
