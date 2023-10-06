#!/bin/bash

config=/home/zhepan/CutTag/code/conf.txt

cores=`sed '/^cores=/!d;s/.*=//' $config`

reference=`sed '/^reference=/!d;s/.*=//' $config`

data=`sed '/^data=/!d;s/.*=//' $config | sed 's/\"//g'`

result_path=`sed '/^result_path=/!d;s/.*=//' $config`
result=`sed '/^result=/!d;s/.*=//' $config`

conda run -n deeptool computeMatrix reference-point  \
       --referencePoint TSS --binSize 50 \
       -S $data  \
       -R $reference \
       -b 3000 \
       -a 3000  \
       --skipZeros -p $cores \
       -o $result_path/$result  
       


