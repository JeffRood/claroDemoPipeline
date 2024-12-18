# Usa una imagen base que soporte ambos entornos
FROM ubuntu:20.04

# Configura el entorno
ENV ACCEPT_EULA=Y
ENV DEBIAN_FRONTEND=noninteractive

# Instala dependencias generales
RUN apt-get update && apt-get install -y \
    curl \
    python3 python3-pip \
    nodejs npm \
    && apt-get clean

RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /app
COPY ./nodejs-service /app/nodejs-service
COPY ./python-service /app/python-service

RUN cd /app/nodejs-service && npm install

RUN pip install -r /app/python-service/requirements.txt

RUN apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 5001


CMD ["/usr/bin/supervisord"]
