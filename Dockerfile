# Use an official Jenkins LTS release as a parent image
FROM jenkins/jenkins:lts

# Install the required plugins
#RUN /usr/local/bin/install-plugins.sh git github
RUN jenkins-plugin-cli \
    --plugins \
    git \
    github
# Install Python and pip
RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip3 install --upgrade pip

# Copy the Jenkinsfile and Python script to the container
COPY Jenkinsfile /var/jenkins_home/Jenkinsfile
COPY main.py /var/jenkins_home/main.py

# Set up the Jenkins job
ENV JENKINS_JOBS_FOLDER=/var/jenkins_home/jobs
RUN mkdir -p $JENKINS_JOBS_FOLDER/Python\ Job && \
    cp /var/jenkins_home/Jenkinsfile $JENKINS_JOBS_FOLDER/Python\ Job/ && \
    chown -R jenkins:jenkins $JENKINS_JOBS_FOLDER

# Expose the Jenkins server port
EXPOSE 8080

# Set the entrypoint to start Jenkins
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]

## Use an official Jenkins LTS release as a parent image
#FROM jenkins/jenkins:lts
#
## Install the required plugins using jenkins-plugin-cli
#RUN /usr/local/bin/install-plugins.sh workflow-aggregator git github && \
#    java -jar /usr/share/jenkins/jenkins.war --install-plugin workflow-aggregator --install-plugin git --install-plugin github
#
## Install Python and pip
#RUN apt-get update && \
#    apt-get install -y python3-pip && \
#    pip3 install --upgrade pip
#
## Copy the Jenkinsfile and Python script to the container
#COPY Jenkinsfile C:/Users/Public/Documents/Jenkins/Jobs/Python\ Job/Jenkinsfile
#COPY main.py C:/Users/Public/Documents/Jenkins/Jobs/Python\ Job/main.py
#
## Set up the Jenkins job
#ENV JENKINS_JOBS_FOLDER=C:/Users/Public/Documents/Jenkins/Jobs
#RUN mkdir -p $JENKINS_JOBS_FOLDER/Python\ Job && \
#    cp C:/Users/Public/Documents/Jenkins/Jobs/Python\ Job/Jenkinsfile $JENKINS_JOBS_FOLDER/Python\ Job/ && \
#    chown -R jenkins:jenkins $JENKINS_JOBS_FOLDER
#
## Expose the Jenkins server port
#EXPOSE 8080
#
## Set the entrypoint to start Jenkins
#ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/jenkins.sh"]
