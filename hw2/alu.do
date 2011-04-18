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

force a x"20"
force b x"80"
run 10ns

force a x"18"
force b x"34"
run 10ns

force a x"F8"
force b x"A1"
run 10ns

force a x"B2"
force b x"C5"
run 10ns

force a x"14"
force b x"BB"
run 10ns

force a x"2A"
force b x"80"
run 10ns

force a x"00"
force b x"1F"
run 10ns

force a x"2F"
force b x"18"
run 10ns

force a x"23"
force b x"8D"
run 10ns

force a x"2B"
force b x"81"
run 10ns

force a x"23"
force b x"40"
run 10ns

force a x"20"
force b x"88"
run 10ns

force a x"20"
force b x"82"
run 10ns

force a x"A5"
force b x"83"
run 10ns

write list alu.list
quit -f
