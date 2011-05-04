#!/bin/bash

if [ ! -d "work" ];
then
    echo "Creating work directory..."
    vlib work
fi

if [ -e "tb.sv" ];
then
    echo "Compiling testbench.sv..."
    vlog tb.sv
fi

if [ -e "updn_cntr.sv" ];
then
    echo "Compiling updn_cntr.sv..."
    vlog updn_cntr.sv
fi

echo "Running testbench..."
#vsim -novopt -t 1ps -do tb.tcl tb
vsim  -novopt -quiet -t 1ps -c -do tb.tcl tb
