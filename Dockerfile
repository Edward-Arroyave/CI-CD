FROM jenkins/jenkins:lts

USER root

# Instalar docker-cli sin demonio
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Permitir que el usuario jenkins use el socket
RUN groupadd -for docker && \
    usermod -aG docker jenkins && \
    chown root:docker /var/run/docker.sock

USER jenkins
