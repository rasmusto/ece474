#single packet
#simulates typical packet all sent on light side      
#tests for data sensitivity
#temperature written to ram should be 67. (0x43)

force data_ena 1
#send a5 header
do a5.do
force data_ena 0
run 20
force data_ena 1
do 3a.do
force data_ena 0
run 200
force data_ena 1
do 55.do
force data_ena 0
run 200
force data_ena 1
do 43.do
force data_ena 0
run 200
force data_ena 1
do 3c.do
force data_ena 0
run 4000
