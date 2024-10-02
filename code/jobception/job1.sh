#!/usr/bin/env bash
#$ -S /bin/bash
#$ -N job1
#$ -q all.q
#$ -cwd
#$ -l h_rt=01:00:00
#$ -l h_rss=30720M,mem_free=30720M
#$ -j y
#$ -o job1.log

export LANGUAGE=en_AU.UTF-8

sleep 10
echo job1 > 1.txt
qsub job2.sh
# does not wait until job2.sh is finished
echo done >> 1.txt
