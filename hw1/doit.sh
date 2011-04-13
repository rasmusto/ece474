#!/bin/bash -e

#exit if there are errors
#set -e

if [ ! -d "work" ];
then
    echo "Creating work directory..."
    vlib work
fi

if [ -e "fadder.sv" ];
then
    echo "Compiling fadder.sv..."
    vlog fadder.sv
fi

if [ -e "adder8.sv" ];
then
    echo "Compiling adder8.sv..."
    vlog adder8.sv
fi

if [ -e "adder8.do" ];
then
    echo "Simulating adder8..."
    #vsim -novopt -t 1ps -do adder8.do adder8
    vsim adder8 -do adder8.do -quiet -c -t 1ps
    mv adder8.list adder8_original.list
fi

if grep Digital_Standard_Cell_Library work/_info
then
    echo "Library is already compiled!"
else
    echo "Compiling Standard Cell Library..."
    #set location of synthesis library
    synop_lib="/nfs/guille/a1/cadlibs/synop_lib/SAED_EDK90nm/Digital_Standard_Cell_Library/verilog"
    echo "***** Compile synthesis library into work *****"
    vlog $synop_lib/*  -work work
fi

if [ -e "syn_adder8" ];
then
    echo "Synthesizing adder8..."
    design_vision-xg -f syn_adder8
    #dc_shell-xg-t -f syn_adder8
fi


if [ -e "adder8.gate.v" ];
then
    echo "Compiling adder8.gate..."
    vlog adder8.gate.v
    if [ -e "adder8.do" ];
    then
        echo "Simulating adder8.gate..."
        #vsim -novopt -t 1ps -do adder8.gate.do adder8.gate
        vsim adder8 -do adder8.do -quiet -c -t 1ps
        mv adder8.list adder8_optimized.list
        if [ -e "adder8_original.list" -a -e "adder8_optimized.list" ]
        then
            echo "Showing differences between the two list files..."
            diff adder8_original.list adder8_optimized.list
        fi
    fi
fi
echo "Cleaning up files..."
rm -f adder8_original.list
rm -f adder8_optimized.list
echo "Done!"
