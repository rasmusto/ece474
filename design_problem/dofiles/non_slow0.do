#single packet
#simulates entire packet that is not a temperature packet
#data coming in slowly

force data_ena 1
#send bogus header
do c2.do
force data_ena 0
run 20
force data_ena 1
#send imbedded header
do a5.do
force data_ena 0
run 4000
force data_ena 1
#send imbedded header
do c3.do
force data_ena 0
run 4000
force data_ena 1
#send imbedded header
do a5.do
force data_ena 0
run 4000
force data_ena 1
#send imbedded header
do c3.do
force data_ena 0
run 4000
