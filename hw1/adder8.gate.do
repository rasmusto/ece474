add list -nodelta
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

add list -notrigger -hex -width 4  -label a          a
add list -notrigger -hex -width 4  -label b          b
add list -notrigger -hex -width 10 -label sum_out    sum_out
add list -notrigger -hex -width 8  -label c_out      c_out

view signals
add wave -r /*

force a x"50"
force b x"50"
run 10ns

force a x"20"
force b x"80"
run 10ns

force a x"10"
force b x"90"
run 10ns

force a x"3B"
force b x"5F"
run 10ns

force a x"1C"
force b x"C2"
run 10ns

force a x"FF"
force b x"FF"
run 10ns

force a x"FF"
force b x"01"
run 10ns

write list adder8.list
