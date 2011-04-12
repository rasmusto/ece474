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
    vsim -novopt -t 1ps -do adder8.do adder8
    #vsim -novopt -t 1ps -do adder8.do -quiet adder8
fi

if [ -e "syn_adder8" ];
then
    echo "Synthesizing adder8..."
    design_vision-xg -f syn_adder8
fi

if [ -e "adder8.gate.v" ];
then
    echo "Compiling adder8.gate..."
    vlog adder8.gate.v
    if [ -e "adder8.gate.do" ];
    then
        echo "Simulating adder8.gate..."
        vsim -novopt -t 1ps -do adder8.gate.do adder8.gate
        #vsim -novopt -t 1ps -do adder8.gate.do -c -quiet adder8.gate
    fi
fi
