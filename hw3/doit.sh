#!/bin/bash

#exit if there are errors
#set -e

if [ ! -d "work" ];
then
    echo "Creating work directory..."
    vlib work
fi

if [ -e "updn_cntr.sv" ];
then
    echo "Compiling updn_cntr.sv..."
    vlog updn_cntr.sv
fi

if [ -e "updn_cntr.do" ];
then
    echo "Simulating updn_cntr..."
    #vsim -novopt -t 1ps -do updn_cntr.do updn_cntr
    vsim updn_cntr -do updn_cntr.do -quiet -c -t 1ps
    mv updn_cntr.list updn_cntr_original.list
fi

if grep Digital_Standard_Cell_Library work/_info >> /dev/null
then
    echo "Library is already compiled!"
else
    echo "Compiling Standard Cell Library..."
    #set location of synthesis library
    synop_lib="/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog"
    echo "***** Compile synthesis library into work *****"
    vlog $synop_lib/*  -work work
fi
