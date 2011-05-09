#double packet
#simulates packet0 that has h0,b0 and h0,b1 sent on
#light side of moon.  Data for h0,b2; h0,b3; h1,b0; and
#h1,b1 was queued on dark side.  Upon entering light side
#dark side data is bursted. This is followed later in time
#by h1,b2 and h1,b3.

#packet 0 is a non-temperature packet
#packet 1 average temperature is 28. (0x1C)

force data_ena 1
#send bogus header
do a1.do
force data_ena 0
run 20
force data_ena 1
#send imbedded header
do c3.do
force data_ena 0
run 4000
force data_ena 1
#send 20
do 20.do
force data_ena 0
#########going behind moon
run 4000
#########emerging into light side
force data_ena 1
#send imbedded header
do a5.do
force data_ena 0
run 20
force data_ena 1
#send 24
do 24.do
force data_ena 0
run 20
#########start reception of second packet
force data_ena 1
#send c3 header
do c3.do
force data_ena 0
run 20
force data_ena 1
#send 26
do 26.do
force data_ena 0
run 20
force data_ena 1
#send 28
do 28.do
force data_ena 0
#done with queued data burst
#now waiting for next temperature reading 
run 4000
force data_ena 1
#send 30
do 30.do
force data_ena 0
run 4000
force data_ena 1
#send 31
do 31.do
force data_ena 0
run 4000
