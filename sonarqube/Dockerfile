FROM sonarsource/sonar-scanner-cli:4.8

# Instalar OpenJDK 17
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*

# Configurar el entorno JAVA_HOME
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH


COPY /conf/sonar-scanner.properties /opt/sonar-scanner/conf/sonar-scanner.properties


# Verificar las versiones de Java y SonarQube Scanner
RUN java -version && sonar-scanner --version


