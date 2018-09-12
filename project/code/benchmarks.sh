#-----------------------------------------------------------------------------------------------#
#-- Benchmark Tests ----------------------------------------------------------------------------#
#-----------------------------------------------------------------------------------------------#

#--------------------#
#-- Sysbench Tests --#
#--------------------#

echo "Now conducting system benchmarks. . ."
echo
echo "---------------------------"
echo "Current benchmark: CPU test"
echo "---------------------------"
sysbench cpu --num-threads=8 run > cpu.txt
# Output: events/sec, avg latency (ms)


echo
echo "--------------------------"
echo "Current benchmark: File IO"
echo "--------------------------"
sysbench fileio --file-total-size=2G prepare
sysbench fileio --file-total-size=2G --file-test-mode=rndrw --time=30 --max-requests=0 --num-threads=8 run > fileio.txt
sysbench fileio --file-total-size=2G cleanup
# output: read/write (mb/s)


#---------------------#
#-- Stress-ng Tests --#
#---------------------#

echo
echo "----------------------------------"
echo "Current benchmark: CPU Stress Test"
echo "----------------------------------"
echo "Duration: 30 seconds"
stress-ng --cpu=-1 --cpu-method=matrixprod -t 30 --metrics-brief --log-file ./stress.txt
echo
echo "---------------------------------"
echo "Current benchmark: HDD Operations"
echo "---------------------------------"
echo "Duration: 30 seconds"
stress-ng --hdd=-1 --hdd-opts=iovec -t 30 --metrics-brief --log-file ./hdd.txt
echo
echo "-----------------------------------"
echo "Current benchmark: Memory Thrashing"
echo "-----------------------------------"
echo "Duration: 30 seconds"
stress-ng --memthrash=-1 --memthrash-method=all -t 30 --metrics-brief --log-file ./memthrash.txt
echo
# output: bogo ops/sec
#-----------------------------------------------------------------------------------------------#
#-----------------------------------------------------------------------------------------------#
#-----------------------------------------------------------------------------------------------#
