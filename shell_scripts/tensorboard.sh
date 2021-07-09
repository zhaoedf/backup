kill -9 $(lsof -t -i:8888)
kill -9 $(lsof -t -i:8889)
kill -9 $(lsof -t -i:9001)


. activate torch

nohup tensorboard --logdir=backup6-tranfer-UNet/runs --port=8888 --bind_all --max_reload_threads 8 > TensorBoard0.log 2>&1 &
nohup tensorboard --logdir=backup7-pretrained-UNet/runs --port=8889 --bind_all --max_reload_threads 8 > TensorBoard1.log 2>&1 &
nohup tensorboard --logdir=backup8-ablation-UNet/runs --port=9001 --bind_all --max_reload_threads 8 > TensorBoard2.log 2>&1 &
