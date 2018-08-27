FROM ubuntu:18.04
LABEL maintainer="rlirey@iu.edu"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install sudo -y
RUN mkdir -p /myapp

WORKDIR /myapp

COPY . .

RUN sudo apt-get install -y tzdata
RUN sudo apt-get install -y python3-tk python3-setuptools python3-pip
RUN pip3 install -r requirements.txt
RUN sudo apt-get install stress-ng -y
RUN sudo apt-get install sysbench -y
RUN chmod u+x ./code/run5times.sh

CMD ["/bin/bash"]
