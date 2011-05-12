#!/bin/bash

if [ ! -d "work" ];
then
    echo "Creating work directory..."
    vlib work
fi

for dir in `ls rtl_src`
do
    echo $dir
    for file in `ls rtl_src/$dir`
    do
        echo "rtl_src/$dir/$file"
        vlog rtl_src/$dir/$file
    done
done
