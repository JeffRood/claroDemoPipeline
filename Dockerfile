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

# Configura Python para usar `python`
RUN ln -s /usr/bin/python3 /usr/bin/python

# Crea los directorios de trabajo
WORKDIR /app

# Copia los archivos del proyecto
COPY ./nodejs-service /app/nodejs-service
COPY ./python-service /app/python-service

# Instala dependencias de Node.js (ahora que tienes package.json)
RUN cd /app/nodejs-service && npm install

# Instala dependencias de Python
RUN pip install -r /app/python-service/requirements.txt

# Instala Supervisor
RUN apt-get install -y supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Expone los puertos necesarios
EXPOSE 5001

# Inicia Supervisor
CMD ["/usr/bin/supervisord"]
