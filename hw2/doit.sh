#!/bin/bash

#exit if there are errors
#set -e

if [ ! -d "work" ];
then
    echo "Creating work directory..."
    vlib work
fi

if [ -e "alu.sv" ];
then
    echo "Compiling alu.sv..."
    vlog alu.sv
fi

if [ -e "alu.do" ];
then
    echo "Simulating alu..."
    #vsim -novopt -t 1ps -do alu.do alu
    vsim alu -do alu.do -quiet -c -t 1ps
    mv alu.list alu8_original.list
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

if [ -e "syn_alu" ];
then
    echo "Synthesizing alu..."
    #design_vision-xg -f syn_alu
    dc_shell-xg-t -f syn_alu
fi


if [ -e "alu.gate.v" ];
then
    echo "Compiling alu.gate..."
    vlog alu.gate.v
    if [ -e "alu.do" ];
    then
        echo "Simulating alu.gate..."
        #vsim -novopt -t 1ps -do alu.gate.do alu.gate
        vsim alu -do alu.do -quiet -c -t 1ps
        mv alu.list alu_optimized.list
        if [ -e "alu_original.list" -a -e "alu_optimized.list" ]
        then
            echo "Showing differences between the two .list files..."
            echo "VVVVVVVV THERE SHOULD BE NOTHING HERE VVVVVVVV"
            diff alu_original.list alu_optimized.list
            echo "^^^^^^^^         WHAT HE SAID         ^^^^^^^^"
        fi
    fi
fi
echo "Cleaning up files..."
rm -f alu_original.list
rm -f alu_optimized.list
echo "Done!"
