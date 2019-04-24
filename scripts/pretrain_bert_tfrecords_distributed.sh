#!/bin/bash

WORLD_SIZE=8
# Change for multinode config
MASTER_ADDR=localhost
MASTER_PORT=6016
NNODES=1
NODE_RANK=0

DISTRIBUTED_ARGS="--nproc_per_node $WORLD_SIZE --nnodes $NNODES --node_rank $NODE_RANK --master_addr $MASTER_ADDR --master_port $MASTER_PORT"

TFRECORDS=`cat /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/files.txt`

train="/ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord0000 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord0001 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord0002 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord0003 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord0004 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord0005 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord0006 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord0007 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord0008 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord0009 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00010 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00011 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00012 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00013 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00014 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00015 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00016 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00017 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00018 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00019 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00020 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00021 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00022 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00023 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00024 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00025 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00026 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00027 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00028 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00029 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00030 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00031 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00032 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00033 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00034 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00035 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00036 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00037 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00038 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00039 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00040 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00041 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00042 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00043 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00044 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00045 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00046 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00047 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00048 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00049 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00050 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00051 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00052 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00053 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00054 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00055 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00056 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00057 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00058 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00059 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00060 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00061 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00062 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00063 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00064 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00065 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00066 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00067 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00068 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00069 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00070 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00071 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00072 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00073 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00074 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00075 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00076 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00077 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00078 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00079 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00080 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00081 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00082 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00083 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00084 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00085 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00086 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00087 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00088 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00089 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00090 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00091 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00092 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00093 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00094 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00095 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00096 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00097 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00098 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord00099 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000100 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000101 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000102 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000103 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000104 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000105 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000106 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000107 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000108 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000109 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000110 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000111 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000112 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000113 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000114 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000115 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000116 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000117 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000118 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000119 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000120 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000121 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000122 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000123 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000124 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000125 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000126 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000127 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000128 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000129 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000130 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000131 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000132 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000133 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000134 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000135 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000136 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000137 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000138 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000139 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000140 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000141 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000142 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000143 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000144 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000145 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000146 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000147 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000148 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000149 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000150 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000151 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000152 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000153 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000154 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000155 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000156 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000157 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000158 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000159 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000160 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000161 /ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000162"
validate="/ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000163"
test="/ncluster/data/bookcorpus.tfrecords/final_tfrecords_sharded/tf_examples.tfrecord000164"

python -m torch.distributed.launch $DISTRIBUTED_ARGS \
  pretrain_bert.py \
    --batch-size 4 \
    --tokenizer-type BertWordPieceTokenizer \
    --cache-dir cache_dir \
    --tokenizer-model-type bert-large-uncased \
    --vocab-size 30522 \
    --use-tfrecords \
    --train-data $train \
    --valid-data $validate \
    --test-data $test \
    --max-preds-per-seq 80 \
    --seq-length 512 \
    --max-position-embeddings 512 \
    --num-layers 24 \
    --hidden-size 1024 \
    --intermediate-size 4096 \
    --num-attention-heads 16 \
    --hidden-dropout 0.1 \
    --attention-dropout 0.1 \
    --train-iters 1000000 \
    --lr 0.0001 \
    --lr-decay-style linear \
    --lr-decay-iters 990000 \
    --warmup .01 \
    --weight-decay 1e-2 \
    --clip-grad 1.0 \
    --fp16 \
    --fp32-layernorm \
    --fp32-embedding \
    --hysteresis 2 \
    --num-workers 2
