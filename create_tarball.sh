#!/bin/bash
if [ $# -ne 1 ]
then
    echo "Usage: create_tarball.sh <directory>"
fi
if [ -d $1 ]
then
    echo "$1 exists and is a directory!"
else
    echo "$1: no such directory"
fi
tar cvf $1.tar --exclude=*.log --exclude=*.txt $1
