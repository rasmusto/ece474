configure list -delta none
configure list -strobestart {9 ns}  -strobeperiod {10 ns}
configure list -usestrobe 1

add list -notrigger      -width 5 -label opcode    opcode
add list -notrigger      -width 9 -label A         in_a
add list -notrigger      -width 9 -label B         in_b
add list -notrigger -hex -width 2 -label c         alu_carry 
add list -notrigger      -width 9 -label alu_out   alu_out
add list -notrigger -hex -width 2 -label z         alu_zero

view signals
add wave -r /*

force in_a      x"FF"
force in_b      x"FF"
force opcode    x"1"
run 10ns

force in_a      x"01"
force in_b      x"FF"
force opcode    x"1"
run 10ns

force in_a      x"92"
force in_b      x"50"
force opcode    x"2"
run 10ns

force in_a      x"FF"
force in_b      x"58"
force opcode    x"2"
run 10ns

force in_a      x"00"
force in_b      x"xx"
force opcode    x"3"
run 10ns

force in_a      x"00"
force in_b      x"xx"
force opcode    x"4"
run 10ns

force in_a      b"11110000"
force in_b      b"10101010"
force opcode    x"5"
run 10ns

force in_a      b"11110000"
force in_b      b"10101010"
force opcode    x"6"
run 10ns

force in_a      b"11110000"
force in_b      b"10101010"
force opcode    x"7"
run 10ns

force in_a      x"FF"
force in_b      x"xx"
force opcode    x"8"
run 10ns

force in_a      x"FF"
force in_b      x"xx"
force opcode    x"9"
run 10ns

force in_a      b"10101010"
force in_b      b"xx"
force opcode    x"A"
run 10ns

force in_a      b"10101010"
force in_b      x"xx"
force opcode    x"B"
run 10ns

write list alu.list
