FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip

USER jenkins

COPY --chown=jenkins:jenkins ./jenkins/plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/plugins.txt

COPY --chown=jenkins:jenkins ./jenkins/jenkins.yaml /var/jenkins_home/casc_configs/jenkins.yaml

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false -Dhudson.model.DirectoryBrowserSupport.CSP=\"default-src 'self' 'unsafe-inline'; img-src 'self';\""

COPY --chown=jenkins:jenkins Jenkinsfile /var/jenkins_home/Jenkinsfile
COPY --chown=jenkins:jenkins main.py /var/jenkins_home/main.py
