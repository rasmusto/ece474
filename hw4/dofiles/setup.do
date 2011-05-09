#view signals
#do wave.do
do list.do
force serial_data  X
force data_ena  0

force -freeze /clk_50 1 -repeat 20
force -freeze /clk_50 0 10 -repeat 20
force -freeze /clk_2 1 -repeat 500
force -freeze /clk_2 0 250 -repeat 500

force reset_n 0 
run 90
force reset_n 1
run 110

run 1000 
#add delay for input data hold time
run 5
