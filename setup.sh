#!/bin/sh
cd /var/jenkins_home/workspace/jenkins
docker container prune << EOF
y
EOF
docker container ls -a | grep "jenkins"
if [ $? -eq 0 ];then
    docker container stop jenkins
    docker container rm jenkins
fi
docker image prune << EOF
y
EOF
docker build -t jenkins .
docker run -d -p 8083:5012 --name=jenkins jenkins