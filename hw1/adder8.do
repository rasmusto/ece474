add list -nodelta
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

add list -notrigger -hex -width 4  -label a          a
add list -notrigger -hex -width 4  -label b          b
add list -notrigger -hex -width 10 -label sum_out    sum_out
add list -notrigger -hex -width 8  -label c_out      c_out

force a  x"50"
force b  x"50"
run 10 ns

write list adder8.list
