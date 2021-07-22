#!/bin/bash
#python train.py -b 4 -e 500 -l 1e-5 -s 1.0 -v 20

. activate torch

if [ $# -eq 0 ]
then
		echo "parameter not passed, using default value!"
        loss_function='Focal'
else
		echo "parameter passed, using parameter passed!"
        loss_function=$1
fi

lr=1e-5
epoch=300
bs=4

#group_count starts from 0, the first group is group0
#4 members in each group(if available)
group=$(cat group.txt)
index=$((10#${group}))

#+0
echo $((index+0))
name0='logs/log_Exp3_leaveout_index_'$((index+0))'.log'
nohup python train.py -i $((index+0)) -b ${bs} -e ${epoch} -l ${lr} -s 1.0 -v 20 -c ${loss_function} > ${name0} 2>&1 &

#+1
#index+=1 incorrect use
name1='logs/log_Exp3_leaveout_index_'$((index+1))'.log'
echo $((index+1))
nohup python train.py -i $((index+1)) -b ${bs} -e ${epoch} -l ${lr} -s 1.0 -v 20 -c ${loss_function} > ${name1} 2>&1 &

#+2
#index+=1 incorrect use
echo $((index+2))
name2='logs/log_Exp3_leaveout_index_'$((index+2))'.log'
nohup python train.py -i $((index+2)) -b ${bs} -e ${epoch} -l ${lr} -s 1.0 -v 20 -c ${loss_function} > ${name2} 2>&1 &

#+3
#index+=1 incorrect use
echo $((index+3))
name3='logs/log_Exp3_leaveout_index_'$((index+3))'.log'
nohup python train.py -i $((index+3)) -b ${bs} -e ${epoch} -l ${lr} -s 1.0 -v 20 -c ${loss_function} > ${name3} 2>&1 &




echo $((index+4)) > group.txt


