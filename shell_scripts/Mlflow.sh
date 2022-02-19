#!/bin/bash

PROC_NAME='mlflow'
NAME='defeng'
ps -ef | grep $PROC_NAME | grep $NAME |grep -v grep

if [ $? -eq 0 ];then
	echo "Found!  killing..."
	ps aux|grep -w $PROC_NAME|grep -v grep|awk '{print $2}'|xargs kill

fi

. activate IL

# or nohup in the head.
#mlflow ui --port 10500 1>_mlflow.log 2>&1 &
mlflow server --backend-store-uri sqlite:////data/defeng/mlruns/mlruns.db --port 10500 --default-artifact-root file:///data/defeng/mlruns/ 1>_mlflow.log 2>&1 &
echo "Done!"
# **************************************************************
# in code, the tracking_uri is set to 'http://localhost:10500' 
# **************************************************************
#cat token.log | grep --color=always -P "token=([0-9]|[a-zA-Z])*" -o | head -n 1
