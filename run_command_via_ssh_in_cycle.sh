#!/bin/bash

example_host="127.0.0.1"
login_str="username@$example_host"

continue_flag=1


example_cmd="ls -l /var/log/; exit"


trap "continue_flag=0" SIGINT

while (( $continue_flag == 1 )); do
    if ping -c1 $example_host >/dev/null 2>&1; then
        ssh ${login_str} $example_cmd &
        wait $!     
    else
        echo "$example_host is Offline!"
        break
    fi
done
