#!/bin/bash
./startVirtualBox.sh

docker-machine ssh mgr1
tce-load -wi bash
tce-load -wi wget
tce-load -wi make
tce-load -wi libtool
tce-load -w -i python3.tcz
wget https://bootstrap.pypa.io/get-pip.py
python3 get-pip.py
export IP=$(ifconfig eth1| grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1')
echo $IP > mgr1IP.txt
sudo docker swarm init --advertise-addr $IP
export JOIN_MGR=$(sudo docker swarm join-token manager -q)
echo $JOIN_MGR > swarmMgr.txt
export JOIN_WRK=$(sudo docker swarm join-token worker -q)
echo $JOIN_WRK > swarmWrk.txt
sudo cp ~/mgr1IP.txt /Users/rirey/GoogleDrive/ExtraLearn/
sudo cp ~/swarmMgr.txt /Users/rirey/GoogleDrive/ExtraLearn/
sudo cp ~/swarmWrk.txt /Users/rirey/GoogleDrive/ExtraLearn/
exit


docker-machine ssh mgr2
cp /Users/rirey/GoogleDrive/ExtraLearn/vb/vb_addMGR.sh .
chmod u+x ./vb_addMGR.sh
./vb_addMGR.sh
exit


docker-machine ssh mgr3
cp /Users/rirey/GoogleDrive/ExtraLearn/vb/vb_addMGR.sh .
chmod u+x ./vb_addMGR.sh
./vb_addMGR.sh
exit


docker-machine ssh wrk1
cp /Users/rirey/GoogleDrive/ExtraLearn/vb/vb_addWRK.sh .
chmod u+x ./vb_addWRK.sh
./vb_addWRK.sh
exit


docker-machine ssh wrk2
cp /Users/rirey/GoogleDrive/ExtraLearn/vb/vb_addWRK.sh .
chmod u+x ./vb_addWRK.sh
./vb_addWRK.sh
exit


docker-machine ssh wrk3
cp /Users/rirey/GoogleDrive/ExtraLearn/vb/vb_addWRK.sh .
chmod u+x ./vb_addWRK.sh
./vb_addWRK.sh
exit


docker-machine ssh wrk4
cp /Users/rirey/GoogleDrive/ExtraLearn/vb/vb_addWRK.sh .
chmod u+x ./vb_addWRK.sh
./vb_addWRK.sh
exit


docker-machine ssh wrk5
cp /Users/rirey/GoogleDrive/ExtraLearn/vb/vb_addWRK.sh .
chmod u+x ./vb_addWRK.sh
./vb_addWRK.sh
exit
















# docker-machine ssh mv1
# curl -O https://raw.githubusercontent.com/docker/example-voting-app/master/docker-stack.yml

sudo wget http://kernel.ubuntu.com/~cking/tarballs/stress-ng/stress-ng-0.09.34.tar.xz
sudo tar xvf stress-ng-0.09.34.tar.xz
cd ./stress-ng-0.09.34
sudo make
cd ..

# sudo curl -Lso- bench.sh | bash
# # cat boot2dock.txt
# # docker stack deploy -c docker-stack.yml vote
# # docker service ls

# docker-machine ssh mv1
# sudo cp /Users/rirey/GoogleDrive/ExtraLearn/benchmarks2.sh /var/lib/boot2docker/
# cd /var/lib/boot2docker/

# sudo sysctl -w vm.max_map_count=262144
# sudo chmod u+x ./benchmarks2.sh
# sudo ./benchmarks2.sh






docker-machine rm mgr1 -y
docker-machine rm mgr2 -y
docker-machine rm mgr3 -y
docker-machine rm wrk1 -y
docker-machine rm wrk2 -y
docker-machine rm wrk3 -y
docker-machine rm wrk4 -y
docker-machine rm wrk5 -y








