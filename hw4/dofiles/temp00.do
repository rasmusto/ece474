#single packet
#simulates typical packet all sent on light side      
#all temperatures are 00                                
#temperature written to ram should be 00. (0x00)

force data_ena 1
#send a5 header
do a5.do
force data_ena 0
run 20
force data_ena 1
#send 10
do 0.do
force data_ena 0
run 200
force data_ena 1
#send 20
do 0.do
force data_ena 0
run 200
force data_ena 1
#send 30
do 0.do
force data_ena 0
run 200
force data_ena 1
#send 40
do 0.do
force data_ena 0
run 4000
