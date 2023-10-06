#!/bin/bash
config=/home/zhepan/CutTag/code/conf.txt
result_path=`sed '/^result_path=/!d;s/.*=//' $config`
result=`sed '/^result=/!d;s/.*=//' $config`

plot_path=`sed '/^plot_path=/!d;s/.*=//' $config`
plot_heatmap=`sed '/^plot_heatmap=/!d;s/.*=//' $config`
heatmap_label=`sed '/^heatmap_label=/!d;s/.*=//' $config | sed 's/\"//g'`
heatmap_color=`sed '/^heatmap_color=/!d;s/.*=//' $config | sed 's/\"//g'`
heatmap_kn=`sed '/^heatmap_kn=/!d;s/.*=//' $config`


conda run -n deeptool plotHeatmap -m $result_path/$result --missingDataColor 1 --heatmapHeight 24 -o $plot_path/$plot_heatmap \
--colorList $heatmap_color --samplesLabel	$heatmap_label --legendLocation none
 #--whatToShow 'heatmap and colorbar'
