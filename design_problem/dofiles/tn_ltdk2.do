#double packet
#simulates packet0 that has h0,b0 only sent on light side 
#of moon. Data for h0,b1; h0,b2; h0,b3; and h1,b0 
#was queued on dark side.  Upon entering light side
#dark side data is bursted. This is followed later in time
#by h1,b1; h1,b2; and h1,b3.

#packet 0 average temperature is 37. (0x25)
#packet 1 is a non-temperature packet       

force data_ena 1
#send a5 header
do a5.do
force data_ena 0
run 20
force data_ena 1
#send 34
do 34.do
force data_ena 0
#########going behind moon
run 4000
#########emerging into light side
force data_ena 1
#send 36
do 36.do
force data_ena 0
run 20   
force data_ena 1
#send 38
do 38.do
force data_ena 0
run 20
force data_ena 1
#send 40
do 40.do
force data_ena 0
run 20
#########start reception of second packet
force data_ena 1
#send non-temperature header
do c6.do
force data_ena 0
run 20
force data_ena 1
#send imbedded header
do c3.do
force data_ena 0
#done with queued data burst
#now waiting for next temperature reading 
run 4000
force data_ena 1
#send imbedded header
do a5.do
force data_ena 0
run 4000
force data_ena 1
#send 46
do 46.do
force data_ena 0
run 4000
force data_ena 1
#send 48
do 48.do
force data_ena 0
run 4000
