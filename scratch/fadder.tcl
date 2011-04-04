view signals
add wave -r /*

force a 0
force b 0 
force cin 0 
run 100

force a 1
force b 0 
force cin 0 
run 100

force a 0
force b 1 
force cin 0 
run 100

force a 1
force b 1 
force cin 0 
run 100

force a 0
force b 0 
force cin 1 
run 100

force a 1
force b 0 
force cin 1 
run 100

force a 0
force b 1 
force cin 1 
run 100

force a 1
force b 1 
force cin 1 
run 100
