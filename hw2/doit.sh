#!/bin/bash

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
    vsim -novopt -t 1ps -do adder8.do adder8
    #vsim adder8 -do adder8.do -novopt -quiet -c -t 1ps
    mv adder8.list adder8_original.list
fi

if [ -e "rtl_src/alu.sv" ];
then
    echo "Compiling rtl_src/alu.sv..."
    vlog rtl_src/alu.sv
fi

if [ -e "rtl_src/alu.do" ];
then
    echo "Simulating rtl_src/alu..."
    #vsim -novopt -t 1ps -do rtl_src/alu.do alu
    vsim alu -do rtl_src/alu.do -novopt -quiet -c -t 1ps
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
        vsim alu -do alu.do -novopt -quiet -c -t 1ps
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
