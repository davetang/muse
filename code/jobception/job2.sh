#!/usr/bin/env bash
#$ -S /bin/bash
#$ -N job2
#$ -q all.q
#$ -cwd
#$ -l h_rt=01:00:00
#$ -l h_rss=30720M,mem_free=30720M
#$ -j y
#$ -o job2.log

export LANGUAGE=en_AU.UTF-8

sleep 10
echo job2 > 2.txt
qsub job3.sh
