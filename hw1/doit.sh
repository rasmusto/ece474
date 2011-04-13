#!/bin/bash
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
fi

if [ -e "syn_adder8" ];
then
    echo "Synthesizing adder8..."
    #design_vision-xg -f syn_adder8
    dc_shell-xg-t -f syn_adder8
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

if [ -e "adder8.gate.v" ];
then
    echo "Compiling adder8.gate..."
    vlog adder8.gate.v
    if [ -e "adder8.gate.do" ];
    then
        echo "Simulating adder8.gate..."
        #vsim -novopt -t 1ps -do adder8.gate.do adder8.gate
        mv adder8.list adder8_old.list
        vsim adder8 -do adder8.do -quiet -c -t 1ps
        echo "Showing differences between the two list files..."
        diff adder8_old.list adder8.list
    fi
fi
echo "Done!"
