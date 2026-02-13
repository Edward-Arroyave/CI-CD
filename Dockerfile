FROM jenkins/jenkins:lts

USER root

# Instalar Docker CLI (no daemon)
RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Crear grupo docker si no existe y agregar el usuario jenkins
RUN groupadd -f docker && \
    usermod -aG docker jenkins

USER jenkins
