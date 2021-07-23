#!/bin/bash

export MLFLOW_TRACKING_URI='http://localhost:10500'
export MLFLOW_EXPERIMENT_NAME='test2'

. activate IL
# Mlflow project path has to be absolute path.
# --storage-dir http://localhost:10500
mlflow run --no-conda -P data_file=/data/defeng/mlruns -P regularization=5.0 -e main /data/defeng/project/
