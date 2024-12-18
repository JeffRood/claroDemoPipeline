FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install -y \
    docker.io \
    curl \
    unzip \
    python3 \
    python3-pip \
    git && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs && \
    npm install -g npm && \
    curl -fsSL https://releases.hashicorp.com/terraform/1.5.5/terraform_1.5.5_linux_amd64.zip -o terraform.zip && \
    unzip terraform.zip && mv terraform /usr/local/bin/ && \
    rm terraform.zip && \
    pip3 install docker-scout-cli

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

USER jenkins
