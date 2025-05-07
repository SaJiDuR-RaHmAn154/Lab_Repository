#!/usr/bin/env bash

showupTime(){
        up=$(uptime -u | cut -c4-)
        since=$(uptime -s)
        cat << EOF

------
This machine has been up for ${up}
It has been running since ${since}
------
EOF
}
showupTime
