#!/bin/bash

set -euxo pipefail

dataroot="/mnt/data"
if [[ $(hostname) == "nipa2020-0909" ]]; then
  echo "running on $(hostname)"
  dataroot="/home/ua/data"
fi
echo "dataroot($dataroot)"

docker run --gpus all --shm-size=1g --ulimit memlock=-1 --ulimit stack=67108864 -it --rm -p 32775:10050 -p 8888 --ipc=host -v $PWD:/workspace/kor_pretrain_LM -v ${dataroot}:/mnt/data kor_pretrain_lm bash
