#!/bin/bash

if [-e work]
then
    vlib work
fi
vlog adder8.sv
vsim -novopt -do adder8.do adder8.sv
