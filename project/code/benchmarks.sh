#-----------------------------------------------------------------------------------------------#
#-- Benchmark Tests ----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------------------------#

#--------------------#
#-- CPU Speed Test --#
#--------------------#

echo "Now conducting system benchmarks. . ."
echo "Current benchmark: CPU test"
sysbench cpu --num-threads=8 run > cpu.txt
# Output: events/sec, avg latency (ms)


#------------------#
#-- File IO Test --#
#------------------#

echo
echo "Current benchmark: File IO"
sysbench fileio --file-total-size=2G prepare
sysbench fileio --file-total-size=2G --file-test-mode=rndrw --time=30 --max-requests=0 --num-threads=8 run > fileio.txt
sysbench fileio --file-total-size=2G cleanup
# output: read/write (mb/s)


#---------------------#
#-- CPU Stress Test --#
#---------------------#

echo
echo "Current benchmark: Stress test"
echo "Duration: 30 seconds"
stress-ng --cpu=-1 --cpu-method=matrixprod -t 60 --metrics-brief --log-file ./stress.txt
# output: bogo ops/sec

#-----------------------------------------------------------------------------------------------#
#-----------------------------------------------------------------------------------------------#
#-----------------------------------------------------------------------------------------------#
