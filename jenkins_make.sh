docker build -t jenkins-master .
docker run  --privileged -i -p 8989:8080 -p 50000:50000 -v `pwd`/jenkins_home:/var/jenkins_home -d jenkins-master
