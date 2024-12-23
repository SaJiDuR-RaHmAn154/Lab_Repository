#!/bin/zsh

showupTime() {
    up=$(uptime | awk -F'(,|up)' '{print $2}' | sed 's/^[ \t]*//')
    since=$(who -b | awk '{print $3, $4}')
    cat << EOF

------
This machine has been up for ${up}
It has been running since ${since}
------
EOF
}

showupTime

