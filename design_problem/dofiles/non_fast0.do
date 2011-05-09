#single packet
#data bursts in at maximum rate
#simulates entire packet that is not a temperature packet
#data fields have imbedded header info

force data_ena 1
#send bogus header
do a1.do
force data_ena 0
run 20
force data_ena 1
#send imbedded header
do a5.do
force data_ena 0
run 20
force data_ena 1
#send imbedded header
do c3.do
force data_ena 0
run 20
force data_ena 1
#send imbedded header
do c3.do
force data_ena 0
run 20
force data_ena 1
#send imbedded header
do a5.do
force data_ena 0
run 4000
