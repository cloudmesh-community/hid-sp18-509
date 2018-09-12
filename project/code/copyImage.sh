#!/bin/bash

#-------------------------------------------#
#--- Transfer graph from container to VM ---#
#-------------------------------------------#

docker cp i523proj:/myapp/benchGraph.png .
exit

#----------------------------------------------#
#--- Transfer graph from VM to host machine ---#
#----------------------------------------------#

docker-machine ssh vm sudo cp /home/docker/benchGraph.png /Users/<yourusername>/





