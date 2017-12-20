#FROM jenkinsci/jenkins:2.11
FROM jenkinsci/jenkins

# install via apt
USER root

RUN \
apt-get update -y &&\
apt-get install -y sudo &&\
echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


USER jenkins
RUN \
sudo apt-get install -y vim &&\
#sudo apt-get install -y docker.io &&\
sudo curl -fsSL get.docker.com | bash 
#sudo docker -d &&\
#sudo echo "DOCKER_OPTS='--insecure-registry 45.32.35.230:5000'" >> /etc/default/docker

# install jenkins plugins
USER root
COPY ./plugins.txt /usr/share/jenkins/plugins.txt
#COPY ./daemon.json /etc/docker/daemon.json
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt

USER jenkins
