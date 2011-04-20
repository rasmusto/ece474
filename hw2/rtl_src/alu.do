configure list -delta none
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

add list -notrigger -hex -width 4  -label in_a      in_a
add list -notrigger -hex -width 4  -label in_b      in_b
add list -notrigger -hex -width 4  -label opcode    opcode
add list -notrigger -hex -width 10 -label alu_out   alu_out
add list -notrigger -hex -width 8  -label carry_out carry_out

view signals
add wave -r /*

write list alu.list
quit -f
