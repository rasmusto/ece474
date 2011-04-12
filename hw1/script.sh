#!/bin/bash
if [ ! -d "work" ]; 
then
    echo "Creating work directory..."
    vlib work
fi

if [ -e "fadder.sv" ];
then
    vlog fadder.sv
fi

if [ -e "adder8.sv" ];
then
    vlog adder8.sv
fi

if [ -e "adder8.do" ];
then
    vsim -novopt -t 1ps -do adder8.do adder8
fi

if [ -e "syn_adder8" ];
then
    design_vision-xg -f syn_adder8
fi
