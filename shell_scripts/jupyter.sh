#!/bin/bash

PROC_NAME='jupyter-notebook'
ps -ef | grep $PROC_NAME | grep -v grep

if [ $? -eq 0 ];then
	echo "Found!  killing..."
	ps aux|grep -w $PROC_NAME|grep -v grep|awk '{print $2}'|xargs kill

fi

# or nohup in the head.
jupyter notebook --ip=0.0.0.0 --no-browser --allow-root --port 18080 > token.log 2>&1 &
echo "Done!"
#cat token.log | grep --color=always -P "token=([0-9]|[a-zA-Z])*" -o | head -n 1
