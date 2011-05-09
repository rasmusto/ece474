#single packet
#simulates entire packet that was queued on dark side
#that is bursted upon entering light side.  The average
#temperature written to ram should be 25. (0x19)

force data_ena 1
#send a5 header
do a5.do
force data_ena 0
run 20
force data_ena 1
#send 10
do 10.do
force data_ena 0
run 20
force data_ena 1
#send 20
do 20.do
force data_ena 0
run 20
force data_ena 1
#send 30
do 30.do
force data_ena 0
run 20
force data_ena 1
#send 40
do 40.do
force data_ena 0
run 4000
