# Utiliza una imagen base de Python con Ubuntu
FROM python:3.9-slim-buster

# Establece el directorio de trabajo
WORKDIR /usr/src/app

# Copia el archivo requirements.txt y instala las dependencias
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código
COPY . .

# Exponer el puerto (ajusta según tu aplicación)
EXPOSE 5001

# Comando para iniciar la aplicación
CMD [ "python", "app/app.py" ]
