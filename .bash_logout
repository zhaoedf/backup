# ~/.bash_logout: executed by bash(1) when login shell exits.

#bash useful_things/shell_scripts/kill_proc_by_name.sh ssh-agent

# when leaving the console clear the screen to increase privacy
echo "Start" > /data/defeng/mess.txt
/bin/bash /data/defeng/kill_proc_by_name.sh ssh-agent
echo "Done" >> /data/defeng/mess.txt
if [ "$SHLVL" = 1 ]; then
    [ -x /usr/bin/clear_console ] && /usr/bin/clear_console -q
fi
