#!/bin/bash

PROC_NAME=$1

echo "**************************************************"
echo ${PROC_NAME}
#ps aux | grep ${PROC_NAME} | grep -vP "(grep)|(bash)"
#ps aux | grep ${PROC_NAME} | grep -vP "(grep)|(bash)" | awk -F' ' '{print $2}'
echo "**************************************************"
#echo $?
NUM=$(ps aux | grep ${PROC_NAME} | grep -vP "(grep)|(bash)" | awk -F' ' '{print $2}' | wc -m)
#echo $NUM
if [ ${NUM} -ne 0 ];then
			ps aux | grep ${PROC_NAME} | grep -vP "(grep)|(bash)" | awk -F' ' '{print $2}'
	        ps aux | grep ${PROC_NAME} | grep -vP "(grep)|(bash)" | awk -F' ' '{print $2}' | xargs -n 1 kill
			echo "Done!"
else
			echo "no such processes!"
fi

echo "**************************************************"
