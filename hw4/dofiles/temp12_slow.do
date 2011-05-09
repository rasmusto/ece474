#single packet
#simulates entire packet that was queued on dark side
#that is bursted upon entering light side.  The average
#temperature written to ram should be 12. (0x0C)

force data_ena 1
#send a5 header
do c3.do
force data_ena 0
run 20
force data_ena 1
#send 5 
do 5.do
force data_ena 0
run 4000
force data_ena 1
#send 10
do 10.do
force data_ena 0
run 4000
force data_ena 1
#send 15
do 15.do
force data_ena 0
run 4000
force data_ena 1
#send 20
do 20.do
force data_ena 0
run 4000
