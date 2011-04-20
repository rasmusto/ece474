#!/bin/bash
if [ $# -ne 1 ]
then
    echo "Usage: create_tarball.sh [DIRECTORY]"
    exit
fi
if [ -d $1 ]
then
    echo "$1 exists and is a directory!"
    tar cvf $1.tar  --exclude=*.log         \
                    --exclude=*.txt         \
                    --exclude=*.svf         \
                    --exclude=*.wlf         \
                    --exclude=transcript    \
                    --exclude=work          \
                    $1
else
    echo "$1: no such directory"
    exit
fi

