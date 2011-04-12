#!/bin/bash
vlog fadder.sv
vlog adder8.sv
#vsim -novopt -do adder8.do adder8
vsim adder8 -do adder8.do -quiet -c -t 1ps
