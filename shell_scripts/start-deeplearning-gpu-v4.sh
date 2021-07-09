#! /bin/bash
## remove tools from path
#export PATH=/usr/lib/qt-3.3/bin:/usr/local/Modules/bin:/app/centos/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
#set -x
SL_USER=$USER
export USER=$SL_USER
export HOME=/GPUFS/$USER

#logfile="$HOME/test_$(date +"%Y%m%d%H%M").log"

#exec 1>$logfile 2>&1


##
#/tools/bin/set-hostname
/app/common/.initsl -u
#start-nslcd
#/tools/bin/start-sshd
#export HOME=/GPUFS/$USER
echo "source /usr/local/Modules/init/profile.sh" >> /etc/profile
echo "module load proxy/1.0.0" >> /etc/profile
echo "export PATH=/app/ubuntu/bin:$PATH" >> /etc/profile
echo "module load proxy/1.0.0 cuda/10.1 cudnn/10.1-v7.6 miniconda3" >> /etc/profile
source /usr/local/Modules/init/profile.sh
module load proxy/1.0.0 cuda/10.1 cudnn/10.1-v7.6 miniconda3

export PATH=/app/ubuntu/bin:$PATH

cd $HOME
#/app/common/ttyd/1.5.2/bin/ttyd -p 30978  /bin/bash &
uid=`id $USER|awk '{print $1}'|awk -F "(" '{print $1}'|awk -F "=" '{print $2}'`
gid=`id $USER|awk '{print $2}'|awk -F "(" '{print $1}'|awk -F "=" '{print $2}'`
/app/common/ttyd/1.5.2/bin/ttyd -p 7681 -u $uid -g $gid /bin/bash &

/etc/init.d/ssh start &
su -c /app/centos/bin/start-deeplearning-gpu-v4-user.sh $USER

while true
do
        sleep 3600
done

