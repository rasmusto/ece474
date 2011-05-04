view signals
add wave -hex clk
add wave -hex reset_n
add wave -hex up_dn
add wave -hex ena
add wave -hex cnt_load
add wave -hex s_reset
add wave -hex cnt_in
add wave -hex term_cnt
add wave -hex cnt_out
run 100ns
quit -f
