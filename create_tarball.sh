#!/bin/bash
if [ $# -ne 1 ]
then
    echo "Usage: create_tarball.sh [DIRECTORY]"
    exit
fi
if [ -d $1 ]
then
    mv $1 rasmusto_$1
    echo "$1 exists and is a directory!"
    tar cvf rasmusto_$1.tar --exclude=*.log         \
                    --exclude=*.txt         \
                    --exclude=*.svf         \
                    --exclude=*.wlf         \
                    --exclude=transcript    \
                    --exclude=work          \
                    rasmusto_$1
    mv rasmusto_$1 $1
else
    echo "$1: no such directory"
    exit
fi

