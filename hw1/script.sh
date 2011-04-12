#!/bin/bash
if [ ! -d "work" ]; 
then
    echo "Creating work directory..."
    vlib work
fi
vlog fadder.sv
vlog adder8.sv
#vsim -novopt -do adder8.do adder8
#vsim adder8 -do adder8.do -quiet -c -t 1ps
vsim -novopt -do adder8.do adder8
