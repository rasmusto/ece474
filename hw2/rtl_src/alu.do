configure list -delta none
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

add list -notrigger -hex -width 8  -label in_a      in_a
add list -notrigger -hex -width 8  -label in_b      in_b
add list -notrigger -hex -width 4  -label opcode    opcode
add list -notrigger -hex -width 8  -label alu_out   alu_out
add list -notrigger -hex -width 1  -label alu_zero  alu_zero
add list -notrigger -hex -width 1  -label alu_carry alu_carry 

view signals
add wave -r /*

force in_a      x"50"
force in_b      x"50"
force opcode    x"1"
run 10ns

force in_a      x"13"
force in_b      x"20"
force opcode    x"1"
run 10ns

force in_a      x"92"
force in_b      x"50"
force opcode    x"1"
run 10ns

force in_a      x"FF"
force in_b      x"58"
force opcode    x"1"
run 10ns

force in_a      x"01"
force in_b      x"02"
force opcode    x"1"
run 10ns

force in_a      x"01"
force in_b      x"01"
force opcode    x"1"
run 10ns

write list alu.list
