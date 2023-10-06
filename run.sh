#!/bin/bash
read -p "computeMatrix = 1/plotHeatmap = 2/plotProfile = 3 >" choose
if [ "$choose" = "1" ]; then
  echo "computeMatrix" && sh /home/zhepan/CutTag/code/computeMatrix.sh;
elif [ "$choose" = "2" ]; then
  echo "plotHeatmap"
  sh /home/zhepan/CutTag/code/plotHeatmap.sh;
elif [ "$choose" = "3" ]; then
  echo "plotProfile" && sh /home/zhepan/CutTag/code/plotProfile.sh;
elif [ "$choose" = "12" ]; then
  echo "compute+plotHeatmap" && sh /home/zhepan/CutTag/code/computeMatrix.sh && sh /home/zhepan/CutTag/code/plotHeatmap.sh;  
elif [ "$choose" = "13" ]; then
  echo "compute+plotProfile" && sh /home/zhepan/CutTag/code/computeMatrix.sh && sh /home/zhepan/CutTag/code/plotProfile.sh;  
elif [ "$choose" = "23" ]; then
  echo "plot Heatmap+Profile" && sh /home/zhepan/CutTag/code/plotHeatmap.sh && sh /home/zhepan/CutTag/code/plotProfile.sh;
elif [ "$choose" = "123" ]; then
  echo "compute+plot" && sh /home/zhepan/CutTag/code/computeMatrix.sh && sh /home/zhepan/CutTag/code/plotHeatmap.sh && sh /home/zhepan/CutTag/code/plotProfile.sh;
else echo "invalid input"
fi
