add list -nodelta

configure list -gateexpr {ram_wr_n'rising && (reset_n == 1)}
configure list -usegating 1

add list -notrigger -hex     -width 11   -label ram_addr  /tas/ram_addr
add list -notrigger -decimal -width 11   -label ram_data  /tas/ram_data
