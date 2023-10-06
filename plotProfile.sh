#!/bin/bash
config=/home/zhepan/CutTag/code/conf.txt
result_path=`sed '/^result_path=/!d;s/.*=//' $config`
result=`sed '/^result=/!d;s/.*=//' $config`

plot_path=`sed '/^plot_path=/!d;s/.*=//' $config`
plot_profile=`sed '/^plot_profile=/!d;s/.*=//' $config`

profile_kn=`sed '/^profile_kn=/!d;s/.*=//' $config`


profile_label=`sed '/^profile_label=/!d;s/.*=//' $config | sed 's/\"//g'`
profile_color=`sed '/^profile_color=/!d;s/.*=//' $config | sed 's/\"//g'`

conda run -n deeptool plotProfile -m $result_path/$result -o $plot_path/$plot_profile --legendLocation upper-right \
--perGroup --samplesLabel	$profile_label --plotType lines \
--colors $profile_color
