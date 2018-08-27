#!/bin/bash
docker-machine create --virtualbox-disk-size 3000 -d virtualbox mgr1
docker-machine start mgr1
docker-machine env mgr1
eval $(docker-machine env mgr1)


docker-machine create --virtualbox-disk-size 3000 -d virtualbox mgr2
docker-machine start mgr2
docker-machine env mgr2
eval $(docker-machine env mgr2)


docker-machine create --virtualbox-disk-size 3000 -d virtualbox mgr3
docker-machine start mgr3
docker-machine env mgr3
eval $(docker-machine env mgr3)


docker-machine create --virtualbox-disk-size 3000 -d virtualbox wrk1
docker-machine start wrk1
docker-machine env wrk1
eval $(docker-machine env wrk1)


docker-machine create --virtualbox-disk-size 3000 -d virtualbox wrk2
docker-machine start wrk2
docker-machine env wrk2
eval $(docker-machine env wrk2)


docker-machine create --virtualbox-disk-size 3000 -d virtualbox wrk3
docker-machine start wrk3
docker-machine env wrk3
eval $(docker-machine env wrk3)


docker-machine create --virtualbox-disk-size 3000 -d virtualbox wrk4
docker-machine start wrk4
docker-machine env wrk4
eval $(docker-machine env wrk4)


docker-machine create --virtualbox-disk-size 3000 -d virtualbox wrk5
docker-machine start wrk5
docker-machine env wrk5
eval $(docker-machine env wrk5)



export M1_IP=$(docker-machine ip mgr1)
export M2_IP=$(docker-machine ip mgr2)
export M3_IP=$(docker-machine ip mgr3)
export W1_IP=$(docker-machine ip wrk1)
export W2_IP=$(docker-machine ip wrk2)
export W3_IP=$(docker-machine ip wrk3)
export W4_IP=$(docker-machine ip wrk4)
export W5_IP=$(docker-machine ip wrk5)



# Generate Ansible 'hosts' file
echo \#$M1_IP mgr1 >> hosts
echo \#$M2_IP mgr2 >> hosts
echo \#$M3_IP mgr3 >> hosts
echo \#$W1_IP wrk1 >> hosts
echo \#$W2_IP wrk2 >> hosts
echo \#$W3_IP wrk3 >> hosts
echo \#$W4_IP wrk4 >> hosts
echo \#$W5_IP wrk5 >> hosts


# Go to SSH directory
cd ~/.ssh/
# Make folder 'vb' (aka VirtualBox)
mkdir vb
# Generate SSH key for that folder
ssh-keygen

# Copy key to each vb node
cat ~/.ssh/vb/id_rsa | ssh docker@$M1_IP 'cat - > ~/.ssh/authorized_keys; chmod u+x ~/.ssh/authorized_keys'
cat ~/.ssh/vb/id_rsa | ssh docker@$M2_IP 'cat - > ~/.ssh/authorized_keys; chmod u+x ~/.ssh/authorized_keys'
cat ~/.ssh/vb/id_rsa | ssh docker@$M3_IP 'cat - > ~/.ssh/authorized_keys; chmod u+x ~/.ssh/authorized_keys'
cat ~/.ssh/vb/id_rsa | ssh docker@$W1_IP 'cat - > ~/.ssh/authorized_keys; chmod u+x ~/.ssh/authorized_keys'
cat ~/.ssh/vb/id_rsa | ssh docker@$W2_IP 'cat - > ~/.ssh/authorized_keys; chmod u+x ~/.ssh/authorized_keys'
cat ~/.ssh/vb/id_rsa | ssh docker@$W3_IP 'cat - > ~/.ssh/authorized_keys; chmod u+x ~/.ssh/authorized_keys'
cat ~/.ssh/vb/id_rsa | ssh docker@$W4_IP 'cat - > ~/.ssh/authorized_keys; chmod u+x ~/.ssh/authorized_keys'
cat ~/.ssh/vb/id_rsa | ssh docker@$W5_IP 'cat - > ~/.ssh/authorized_keys; chmod u+x ~/.ssh/authorized_keys'



