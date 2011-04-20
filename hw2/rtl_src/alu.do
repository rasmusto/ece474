add list -nodelta
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

view signals
add wave -r /*

write list alu.list
quit -f
