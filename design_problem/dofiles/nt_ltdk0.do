#double packet
#simulates packet0 that has h0,b0 and h0,b1 and h0,b2 sent on
#light side of moon.  Data for h0,b3; h1,b0; h1,b1 and h1,b2 
#was queued on dark side.  Upon entering light side dark side 
#data is bursted. This is followed much later by h1,b3.  
#packet h0 is a non-temperature packet.
#packet h1 is a temperature packet.

#packet 1 average temperature is 13. (0x0D)

force data_ena 1
#send bogus a1 header
do a1.do
force data_ena 0
run 20
force data_ena 1
#send valid header a5 inside of non-temp packet
do a5.do
force data_ena 0
run 4000
force data_ena 1
#send valid header c3 inside of non-temp packet
do c3.do
force data_ena 0
run 4000
force data_ena 1
#send valid header a5 inside of non-temp packet
do a5.do
force data_ena 0
#########going behind moon
run 4000
#########emerging into light side
force data_ena 1
#send valid header c3 inside of non-temp packet
do c3.do
force data_ena 0
run 20
#########start reception of second packet
force data_ena 1
#send c3 header
do c3.do
force data_ena 0
run 20
force data_ena 1
#send 10
do 10.do
force data_ena 0
run 20
force data_ena 1
#send 12
do 12.do
force data_ena 0
run 20
force data_ena 1
#send 14
do 14.do
force data_ena 0
#done with queued data burst
#now waiting for next temperature reading 
run 4000
force data_ena 1
#send 16
do 16.do
force data_ena 0
run 4000
